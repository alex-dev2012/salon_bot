from aiogram import Router, F
from aiogram.filters import Command, CommandStart
from aiogram.types import Message, CallbackQuery
from texts import START_CMD_TEXT, PRICE_LIST_TEXT, BOT_INFO_TEXT
from keyboard import start_kb, back_to_start_kb, record_kb


router = Router()

@router.message(CommandStart())
async def start_cmd(message: Message):
    await message.answer(START_CMD_TEXT, reply_markup=start_kb)

@router.callback_query(F.data == 'price-list')
async def price_list(callback: CallbackQuery):
    await callback.message.edit_text(PRICE_LIST_TEXT, reply_markup=back_to_start_kb)

@router.callback_query(F.data == 'back_to_start')
async def back_to_start(callback: CallbackQuery):
    await callback.message.edit_text(text=START_CMD_TEXT, reply_markup=start_kb)

@router.callback_query(F.data == 'note')
async def Record(callback: CallbackQuery):
    await callback.message.edit_text(text=BOT_INFO_TEXT, reply_markup=record_kb)



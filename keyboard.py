from aiogram.types import KeyboardButton, InlineKeyboardButton, ReplyKeyboardMarkup, InlineKeyboardMarkup, ReplyKeyboardRemove
from aiogram.utils.keyboard import InlineKeyboardBuilder, ReplyKeyboardBuilder

start_kb = InlineKeyboardMarkup(inline_keyboard=[
    [InlineKeyboardButton(text='➕Записаться к мастеру', callback_data='note'), InlineKeyboardButton(text='❌Отмена записи', callback_data='cancel')],
    [InlineKeyboardButton(text='💲Прайс-лист', callback_data='price-list'), InlineKeyboardButton(text='🧰Портфолио', callback_data='portfolio')],
    [InlineKeyboardButton(text='👤Админ-панель', callback_data='admin')]
])

back_to_start_kb = InlineKeyboardMarkup(inline_keyboard=[
    [InlineKeyboardButton(text='⬅️Назад', callback_data='back_to_start')]
])


record_kb = InlineKeyboardMarkup(inline_keyboard=[
    [InlineKeyboardButton(text='➕ записаться', callback_data='record')],
    [InlineKeyboardButton(text='⬅️Назад', callback_data='back_to_start')],
    [InlineKeyboardButton(text='👤посмотреть профиль мастера', callback_data='profile')]
])

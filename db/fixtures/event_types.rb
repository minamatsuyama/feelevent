# coding: utf-8
# frozen_string_literal: true
Event::Type.seed(
  :id,
  { id: 1, name: '参加型', code: 'participatory' },
  { id: 2, name: '講義型', code: 'lecture' },
  { id: 3, name: '評価型', code: 'evaluation' }
)

package com.jhta.neocom.mapper;


import java.util.List;

import com.jhta.neocom.model.BoardVo;



public interface BoardMapper {
int create (BoardVo vo);
BoardVo select(int bno);
int update (BoardVo vo);
int remove (int bno);
List<BoardVo> list();



}

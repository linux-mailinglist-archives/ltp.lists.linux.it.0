Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236F686CE
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 12:04:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18FED3C1D05
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 12:04:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 92D5F3C1CFB
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 12:04:54 +0200 (CEST)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B2BBA1000B5C
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 12:04:45 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6FA4lIX026406
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Mon, 15 Jul 2019 03:04:47 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
 Mon, 15 Jul 2019 03:04:46 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <ltp@lists.linux.it>, <jstancek@redhat.com>
Date: Mon, 15 Jul 2019 06:03:56 -0400
Message-ID: <1563185037-236824-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V4] getrlimit03: adjust a bit of code to compatiable
 with mips32
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

V4:
	Use better macro to filter mips32

V3:
	The V2 break other arch. fix it.

V2: 
	modify commit log

Hongzhi.Song (1):
  getrlimit03: adjust a bit of code to compatiable with mips32

 testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.8.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

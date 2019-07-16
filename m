Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289E6A483
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 11:05:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F38833C1D0F
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 11:05:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B597F3C1508
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 11:05:23 +0200 (CEST)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 34A5C20100C
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 11:05:19 +0200 (CEST)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6G95Cxp010158
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Tue, 16 Jul 2019 02:05:12 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
 Tue, 16 Jul 2019 02:05:11 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <ltp@lists.linux.it>, <jstancek@redhat.com>
Date: Tue, 16 Jul 2019 05:04:21 -0400
Message-ID: <1563267862-42483-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V5] getrlimit03: adjust a bit of code to compatiable
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

V5:
	replace __mips macro with __mips__
V4:
	Use ABI32 macro to filter mips32
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

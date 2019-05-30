Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B62F902
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 11:10:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC97C3EA603
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 11:10:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B6E6D3EA1DA
 for <ltp@lists.linux.it>; Thu, 30 May 2019 11:10:16 +0200 (CEST)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D7F521401252
 for <ltp@lists.linux.it>; Thu, 30 May 2019 11:10:13 +0200 (CEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R281e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01422; MF=caspar@linux.alibaba.com; NM=1;
 PH=DS; RN=3; SR=0; TI=SMTPD_---0TT.cSLj_1559207409; 
Received: from linux.alibaba.com(mailfrom:caspar@linux.alibaba.com
 fp:SMTPD_---0TT.cSLj_1559207409) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 30 May 2019 17:10:10 +0800
From: Caspar Zhang <caspar@linux.alibaba.com>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Thu, 30 May 2019 17:09:56 +0800
Message-Id: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.5 required=7.0 tests=ENV_AND_HDR_SPF_MATCH,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: [LTP] [PATCH 1/3] tst_test: fix again when test has both TPASS and
	TCONF
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Q29uc2lkZXIgdGhpcyBzaXR1YXRpb246IHdlIGdldCBvbmx5IFRQQVNTIGFuZCBUQ09ORiBpbiB0
ZXN0CnJlc3VsdHMsIGFuZCB0aGUgbGFzdCBzdGF0dXMgaGFwcGVucyB0byBiZSBUUEFTUywgdGhl
IGNoZWNrCmNvbmRpdGlvbiBpbiBjb21taXQgZmVjZGQ4ODVlYjRiICgidHN0X3Rlc3Q6IEZpeCBl
eGl0IHZhbHVlIG9uCnRzdF9icmsoVENPTkYsIC4uLikiIHdvbid0IHdvcmsuIEZpeCBpdCBieSBy
ZW1vdmluZyB1bm5lY2Vzc2FyeQpUQ09ORiBjaGVjay4KCkZpeGVzOiA1MzkwZDZlYTM2NTcgKCJs
aWIvdHN0X3Rlc3Q6IFJlcG9ydCAwIGlmIHRlc3QgaGFzIGJvdGggVFBBU1MgYW5kIFRDT05GIikK
U2lnbmVkLW9mZi1ieTogQ2FzcGFyIFpoYW5nIDxjYXNwYXJAbGludXguYWxpYmFiYS5jb20+Ci0t
LQogbGliL3RzdF90ZXN0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvdHN0X3Rlc3QuYyBiL2xpYi90c3RfdGVz
dC5jCmluZGV4IDJkODhhZGJkNy4uOGJhMTIyZmJlIDEwMDY0NAotLS0gYS9saWIvdHN0X3Rlc3Qu
YworKysgYi9saWIvdHN0X3Rlc3QuYwpAQCAtNTk0LDcgKzU5NCw3IEBAIHN0YXRpYyB2b2lkIGRv
X2V4aXQoaW50IHJldCkKIAkJcHJpbnRmKCJza2lwcGVkICAlZFxuIiwgcmVzdWx0cy0+c2tpcHBl
ZCk7CiAJCXByaW50Zigid2FybmluZ3MgJWRcbiIsIHJlc3VsdHMtPndhcm5pbmdzKTsKIAotCQlp
ZiAocmVzdWx0cy0+cGFzc2VkICYmIHJldCA9PSBUQ09ORikKKwkJaWYgKHJlc3VsdHMtPnBhc3Nl
ZCkKIAkJCXJldCA9IDA7CiAKIAkJaWYgKHJlc3VsdHMtPmZhaWxlZCkKLS0gCjIuMjEuMAoKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

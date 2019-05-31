Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA13930BE3
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 11:43:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BF933EA1B6
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 11:43:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E50853EA04A
 for <ltp@lists.linux.it>; Fri, 31 May 2019 11:43:02 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BF5011A00F66
 for <ltp@lists.linux.it>; Fri, 31 May 2019 11:43:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F1900AE51
 for <ltp@lists.linux.it>; Fri, 31 May 2019 09:43:00 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 31 May 2019 11:43:00 +0200
Message-Id: <20190531094300.8409-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] insmod01: Add license to the dummy module
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

VGhpcyBmaXhlcyAiTWlzc2luZyBtb2R1bGUgbGljZW5jZSIgdGFpbnQgd2hlbiBtb2R1bGUgaXMg
aW5zZXJ0ZWQgaW50bwp0aGUga2VybmVsLgoKU2lnbmVkLW9mZi1ieTogQ3lyaWwgSHJ1YmlzIDxj
aHJ1YmlzQHN1c2UuY3o+Ci0tLQogdGVzdGNhc2VzL2NvbW1hbmRzL2luc21vZC9sdHBfaW5zbW9k
MDEuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS90ZXN0Y2FzZXMvY29tbWFuZHMvaW5zbW9kL2x0cF9pbnNtb2QwMS5jIGIvdGVzdGNhc2VzL2Nv
bW1hbmRzL2luc21vZC9sdHBfaW5zbW9kMDEuYwppbmRleCAzOTg3MTRlNzguLjllODU5NTEwYSAx
MDA2NDQKLS0tIGEvdGVzdGNhc2VzL2NvbW1hbmRzL2luc21vZC9sdHBfaW5zbW9kMDEuYworKysg
Yi90ZXN0Y2FzZXMvY29tbWFuZHMvaW5zbW9kL2x0cF9pbnNtb2QwMS5jCkBAIC0zMSw1ICszMSw3
IEBAIHN0YXRpYyB2b2lkIHRlc3RfZXhpdCh2b2lkKQogCiB9CiAKK01PRFVMRV9MSUNFTlNFKCJH
UEwiKTsKKwogbW9kdWxlX2luaXQodGVzdF9pbml0KTsKIG1vZHVsZV9leGl0KHRlc3RfZXhpdCk7
Ci0tIAoyLjE5LjIKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==

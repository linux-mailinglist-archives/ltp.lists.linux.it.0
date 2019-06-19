Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9D54B890
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 14:32:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A490A3EA549
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 14:32:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A66643EA2E7
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 14:31:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 64F6B600BD8
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 14:31:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 07ACCAF98;
 Wed, 19 Jun 2019 12:31:51 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 19 Jun 2019 14:31:48 +0200
Message-Id: <20190619123148.29733-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190619123148.29733-1-chrubis@suse.cz>
References: <20190619123148.29733-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/sync_file_range02: Skip test on fuse.
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

VGhlIHN5c2NhbGwgaXMgbm90IGltcGxlbWVudGVkIG9uIEZVU0UsIGFzIGEgbWF0dGVyIG9mIGZh
Y3QgaXQgcmV0dXJucwp3aXRoIHN1Y2Nlc3MgYnV0IGRvZXMgbm90aGluZyBzbyB3ZSBldmVuIGNh
bm5vdCBkZXRlY3QgaWYgaXQncwppbXBsZW1lbnRlZCBvciBub3Qgc28gbGV0J3MganVzdCBza2lw
IGl0LgoKU2lnbmVkLW9mZi1ieTogQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+CkNDOiBB
bWlyIEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgpDQzogU3VtaXQgR2FyZyA8c3VtaXQu
Z2FyZ0BsaW5hcm8ub3JnPgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3luY19maWxl
X3JhbmdlL3N5bmNfZmlsZV9yYW5nZTAyLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3luY19maWxl
X3JhbmdlL3N5bmNfZmlsZV9yYW5nZTAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N5
bmNfZmlsZV9yYW5nZS9zeW5jX2ZpbGVfcmFuZ2UwMi5jCmluZGV4IGQ0YzI5ZjljMi4uZWIwODE0
M2MzIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N5bmNfZmlsZV9yYW5n
ZS9zeW5jX2ZpbGVfcmFuZ2UwMi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3lu
Y19maWxlX3JhbmdlL3N5bmNfZmlsZV9yYW5nZTAyLmMKQEAgLTEyMSw2ICsxMjEsNyBAQCBzdGF0
aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CiAJLm5lZWRzX3Jvb3QgPSAxLAogCS5tb3VudF9k
ZXZpY2UgPSAxLAogCS5hbGxfZmlsZXN5c3RlbXMgPSAxLAorCS5kZXZfZnNfZmxhZ3MgPSBUU1Rf
RlNfU0tJUF9GVVNFLAogCS5tbnRwb2ludCA9IE1OVFBPSU5ULAogCS5zZXR1cCA9IHNldHVwLAog
CS50ZXN0ID0gcnVuLAotLSAKMi4xOS4yCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

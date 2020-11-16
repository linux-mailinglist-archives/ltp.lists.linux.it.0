Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 107C02B446D
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 14:09:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 996D23C6499
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 14:09:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3C32B3C4F46
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 14:09:25 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 27F4C1400DAD
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 14:09:24 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 0E6B69F928
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605532163; bh=4COdA442FmcyJBNxHQhCVB+0LKX38ikspu1n03hsswk=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=jpG0oX8cIKeu1bumkqIa/xatAWWIoTtdyHlfNFQfl9mjWXDJPvVJdn7xwy+6NAFbc
 VvBSBcQVl0GrKQRB3L0eCvYL04/0zzzp9SEnuO94/yI3l9Vycz7KdgEfxJezMoOkMI
 anPfpAmQlWCXKJVaivEX1kRqC4wd5XXKDQxvOolg=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Mon, 16 Nov 2020 14:09:14 +0100
Message-Id: <20201116130915.18264-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/1] overcommit_memory: Remove unstable subtest
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CkhpLAoKdGhpcyBpcyBzb21ldGhpbmcgbGlrZSBhbiBSRkMuIChJIHRoaW5rIEkgbWl4ZWQgbXkg
dGhvdWdodHMKYmV0d2VlbiB0aGlzIGFuZCB0aGUgcGF0Y2ggZGVzY3JpcHRpb24uIE1heWJlIHJl
YWQgdGhlIHBhdGNoCmRlc2NyaXB0aW9uIGZpcnN0KS4KSSBmb3VuZCB0aGUgb3ZlcmNvbW1pdF9t
ZW1vcnkgdGVzdCwgdGhhdCB0cmllcyB0byBhbGxvY2F0ZQphbGwgYWxvY2F0YWJsZSBtZW1vcnkg
Zm9yIG92ZXJjb21taXQgcG9saWN5IG5ldmVyLCBmYWlsZWQgCmEgbG90IGFuZCBhIGxvdCBtb3Jl
IG9mdGVuLCBpZiB0aGUgc3lzdGVtIGhhcyBtb3JlIG1lbW9yeS4KV2hlbiBsb29raW5nIGF0IHRo
ZSBrZXJuZWwgc291cmNlIEkgZm91bmQgdGhlIHJlYXNvbjogClRoZSBwZXJjcHUgY291bnRlciB0
aGF0IGNvdW50cyB0aGUgdXNlZCBtZW1vcnkgdXNlcyBhIApjb3VudGVyIGZvciBldmVyeSBjcHUs
IGlmIHRoZSBhbGxvY2F0aW9uIG9yIGRlYWxsb2NhdGlvbnMgCmFyZSB2ZXJ5IHNtYWxsLiBUaGUg
bW9yZSBtZW1vcnkgdGhlIHN5c3RlbSBoYXMsIAp0aGUgYmlnZ2VyICJzbWFsbCIgaXMgZGVmaW5l
ZC4gU2VlIG1tX2NvbXB1dGVfYmF0Y2guCgpJIHN0YXJ0ZWQgc2VlaW5nIHRoaXMgaXNzdWUgYSBs
b3QgYWZ0ZXIgdXBncmFkaW5nIHRvIDIwMjAwOTMwCmNvbW1pbmcgZnJvbSAyMDE5MDExNS4gU29t
ZSBjaGFuZ2VzIGluIHRoZSBmcmFtZXdvcmsgbWF5IGhhdmUKbGVkIHRvIHRoaXMuCgpJIGRvbid0
IHRoaW5rIHRoaXMgaXMgYSBrZXJuZWwgYnVnLCBidXQgYSByZXN1bHQgZnJvbSBzd2l0Y2hpbmcK
YmV0d2VlbiBvdmVyY29tbWl0IG1vZGVzLiBJbiBvdmVyY29tbWl0IG1vZGUgbmV2ZXIsIHRoZSBi
YXRjaApzaXplIGlzIGEgbG90IHNtYWxsZXIgdGhhbiBpbiB0aGUgb3RoZXIgbW9kZXMKKHJhbV9w
YWdlcy9jcHVzLzI1NiBpbnN0ZWFkIG9mIHJhLF9wYWdlcy9jcHVzLzQpLgpUaGlzIGxlYWRzIHRv
IGFsbG9jYXRpb25zIGRvbmUgYmVmb3JlIHN3aXRjaGluZyB0aGUgbW9kZSB0byBiZQphY2NvdW50
ZWQgaW4gdGhlIHBlciBjcHUgY291bnRlcnMsIGFuZCBkZWFsbG9jYXRlZCBhZnRlciBpbiB0aGUK
Z2xvYmFsIGNvdW50ZXIsIG1ha2luZyB0aGUgZ2xvYmFsIGNvdW50ZXIgbmVnYXRpdmUuIElmIHRo
ZQpvdmVyY29tbWl0IG1vZGUgd2FzIHRoZSBzYW1lIGFsbCB0aGUgdGltZSwgaXQgc2hvdWxkIGFs
bCBoYXZlCmJlZW4gYWNjb3VudGVkIGluIHRoZSBzYW1lIGNvdW50ZXJzIGFuZCB0aGUgZ2xvYmFs
IGNvdW50ZXIKd291bGRuJ3QgYmUgbmVnYXRpdmUuCgpKw7ZyZwoKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

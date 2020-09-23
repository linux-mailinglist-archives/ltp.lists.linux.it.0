Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FF92754C5
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:48:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DBAC3C4D50
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:48:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B87683C101E
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:48:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4F528200C24
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:48:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B615EAFCF;
 Wed, 23 Sep 2020 09:49:33 +0000 (UTC)
Date: Wed, 23 Sep 2020 11:48:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200923094855.GA31249@dell5510>
References: <20200923084422.13101-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923084422.13101-1-yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/recvmmsg01.c: Fix a compiler error
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

PiBVc2UgY29ycmVjdCB0cy50eXBlIHRvIGZpeCB0aGUgZm9sbG93aW5nIGNvbXBpbGVyIGVycm9y
Ogo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gcmVjdm1t
c2cwMS5jOjg2Ojk6IGVycm9yOiByZXF1ZXN0IGZvciBtZW1iZXIg4oCYdHlwZeKAmSBpbiBzb21l
dGhpbmcgbm90IGEgc3RydWN0dXJlIG9yIHVuaW9uCj4gICB0aW1lb3V0LnR5cGUgPSB0di0+dHNf
dHlwZTsKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKPiBG
aXhlczogMTM1YWY4ZWRlZGQ0ICgic3lzY2FsbHMve3NlbmR8cmVjdn1tbXNnOiBhZGQgYSB0ZXN0
IGNhc2UgZm9yIHRpbWVvdXQgYW5kIGVycm5vIHRlc3QiKQo+IFNpZ25lZC1vZmYtYnk6IFhpYW8g
WWFuZyA8eWFuZ3guanlAY24uZnVqaXRzdS5jb20+CgpSZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8
cHZvcmVsQHN1c2UuY3o+CgpQUzogbXkgc29sdXRpb24gd2FzIHdyb25nLgoKCktpbmQgcmVnYXJk
cywKUGV0cgoKPiAtLS0KPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9yZWN2bW1zZy9yZWN2
bW1zZzAxLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9yZWN2bW1z
Zy9yZWN2bW1zZzAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3JlY3ZtbXNnL3JlY3Zt
bXNnMDEuYwo+IGluZGV4IGZlNjM3NDMwYi4uZDNmMmRmNmQ5IDEwMDY0NAo+IC0tLSBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvcmVjdm1tc2cvcmVjdm1tc2cwMS5jCj4gKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9yZWN2bW1zZy9yZWN2bW1zZzAxLmMKPiBAQCAtODMsNyArODMs
NyBAQCBzdGF0aWMgdm9pZCBkb190ZXN0KHVuc2lnbmVkIGludCBpKQo+ICAJbWVtc2V0KHJjdjEt
Pmlvdl9iYXNlLCAwLCByY3YxLT5pb3ZfbGVuKTsKPiAgCW1lbXNldChyY3YyLT5pb3ZfYmFzZSwg
MCwgcmN2Mi0+aW92X2xlbik7Cgo+IC0JdGltZW91dC50eXBlID0gdHYtPnRzX3R5cGU7Cj4gKwl0
cy50eXBlID0gdHYtPnRzX3R5cGU7Cj4gIAl0c3RfdHNfc2V0X3NlYygmdHMsIHRjLT50dl9zZWMp
Owo+ICAJdHN0X3RzX3NldF9uc2VjKCZ0cywgdGMtPnR2X25zZWMpOwoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED1E2C5D9A
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 22:47:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DEDF3C5E25
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 22:47:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 608F53C5E18
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 22:47:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 135BF60091B
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 22:47:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 557F3ADA2
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 21:47:03 +0000 (UTC)
Date: Thu, 26 Nov 2020 22:47:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20201126214701.GA8026@pevik>
References: <20201126214121.6836-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126214121.6836-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/6] Introduce SAFE_FANOTIFY_MARK() macro +
 cleanup
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

QlRXOgoKRllJIHRoaXMgaXMgdGhlIGZpcnN0IHBhY2hzZXQgd2hpY2ggYnJva2UgQ2VudE9TIDYK
KGtlcm5lbDogMi42LjMyLTY5NiwgZ2xpYmM6IDIuMTIpLgpCdXQgd2UndmUganVzdCBhZ3JlZWQg
dG8gbm90IHN1cHBvcnQgaXQuLi4KCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBmYW5vdGlmeTAxLmM6
MjE6CmZhbm90aWZ5Lmg6IEluIGZ1bmN0aW9uIOKAmHJlcXVpcmVfZmFub3RpZnlfYWNjZXNzX3Bl
cm1pc3Npb25zX3N1cHBvcnRlZF9ieV9rZXJuZWzigJk6CmZhbm90aWZ5Lmg6MzAxOiB3YXJuaW5n
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhTQUZFX0ZBTk9USUZZX0lOSVTi
gJkKZmFub3RpZnkuaDozMDE6IGVycm9yOiDigJhGQU5fQ0xBU1NfQ09OVEVOVOKAmSB1bmRlY2xh
cmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKZmFub3RpZnkuaDozMDE6IGVycm9yOiAo
RWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlCmZhbm90aWZ5
Lmg6MzAxOiBlcnJvcjogZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbi4pCmZhbm90aWZ5
Lmg6MzAzOiBlcnJvcjog4oCYRkFOX01BUktfQURE4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKQpmYW5vdGlmeS5oOjMwMzogZXJyb3I6IOKAmEZBTl9BQ0NFU1NfUEVS
TeKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKZmFub3RpZnkuaDog
SW4gZnVuY3Rpb24g4oCYZmFub3RpZnlfZXhlY19ldmVudHNfc3VwcG9ydGVkX2J5X2tlcm5lbOKA
mToKZmFub3RpZnkuaDozMjE6IGVycm9yOiDigJhGQU5fQ0xBU1NfQ09OVEVOVOKAmSB1bmRlY2xh
cmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKZmFub3RpZnkuaDozMjM6IGVycm9yOiDi
gJhGQU5fTUFSS19BRETigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24p
CmZhbm90aWZ5Lmg6IEluIGZ1bmN0aW9uIOKAmGZhbm90aWZ5X2Zhbl9yZXBvcnRfZmlkX3N1cHBv
cnRlZF9vbl9mc+KAmToKZmFub3RpZnkuaDozNDI6IGVycm9yOiDigJhGQU5fQ0xBU1NfTk9USUbi
gJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCmZhbm90aWZ5Lmg6MzQ0
OiBlcnJvcjog4oCYRkFOX01BUktfQURE4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlz
IGZ1bmN0aW9uKQpmYW5vdGlmeS5oOjM0NTogZXJyb3I6IOKAmEZBTl9BQ0NFU1PigJkgdW5kZWNs
YXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCmZhbm90aWZ5Lmg6MzQ1OiBlcnJvcjog
4oCYRkFOX01PRElGWeKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikK
ZmFub3RpZnkuaDozNDU6IGVycm9yOiDigJhGQU5fQ0xPU0XigJkgdW5kZWNsYXJlZCAoZmlyc3Qg
dXNlIGluIHRoaXMgZnVuY3Rpb24pCmZhbm90aWZ5Lmg6MzQ1OiBlcnJvcjog4oCYRkFOX09QRU7i
gJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCm1ha2U6ICoqKiBbZmFu
b3RpZnkwMV0gRXJyb3IgMQptYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4u
LgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gZmFub3RpZnkwMi5jOjIxOgpmYW5vdGlmeS5oOiBJbiBm
dW5jdGlvbiDigJhyZXF1aXJlX2Zhbm90aWZ5X2FjY2Vzc19wZXJtaXNzaW9uc19zdXBwb3J0ZWRf
Ynlfa2VybmVs4oCZOgpmYW5vdGlmeS5oOjMwMTogd2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRp
b24gb2YgZnVuY3Rpb24g4oCYU0FGRV9GQU5PVElGWV9JTklU4oCZCmZhbm90aWZ5Lmg6MzAxOiBl
cnJvcjog4oCYRkFOX0NMQVNTX0NPTlRFTlTigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRo
aXMgZnVuY3Rpb24pCmZhbm90aWZ5Lmg6MzAxOiBlcnJvcjogKEVhY2ggdW5kZWNsYXJlZCBpZGVu
dGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZQpmYW5vdGlmeS5oOjMwMTogZXJyb3I6IGZvciBl
YWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4uKQpmYW5vdGlmeS5oOjMwMzogZXJyb3I6IOKAmEZB
Tl9NQVJLX0FEROKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKZmFu
b3RpZnkuaDozMDM6IGVycm9yOiDigJhGQU5fQUNDRVNTX1BFUk3igJkgdW5kZWNsYXJlZCAoZmly
c3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCmZhbm90aWZ5Lmg6IEluIGZ1bmN0aW9uIOKAmGZhbm90
aWZ5X2V4ZWNfZXZlbnRzX3N1cHBvcnRlZF9ieV9rZXJuZWzigJk6CmZhbm90aWZ5Lmg6MzIxOiBl
cnJvcjog4oCYRkFOX0NMQVNTX0NPTlRFTlTigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRo
aXMgZnVuY3Rpb24pCmZhbm90aWZ5Lmg6MzIzOiBlcnJvcjog4oCYRkFOX01BUktfQURE4oCZIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQpmYW5vdGlmeS5oOiBJbiBmdW5j
dGlvbiDigJhmYW5vdGlmeV9mYW5fcmVwb3J0X2ZpZF9zdXBwb3J0ZWRfb25fZnPigJk6CmZhbm90
aWZ5Lmg6MzQyOiBlcnJvcjog4oCYRkFOX0NMQVNTX05PVElG4oCZIHVuZGVjbGFyZWQgKGZpcnN0
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQpmYW5vdGlmeS5oOjM0NDogZXJyb3I6IOKAmEZBTl9NQVJL
X0FEROKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKZmFub3RpZnku
aDozNDU6IGVycm9yOiDigJhGQU5fQUNDRVNT4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0
aGlzIGZ1bmN0aW9uKQpmYW5vdGlmeS5oOjM0NTogZXJyb3I6IOKAmEZBTl9NT0RJRlnigJkgdW5k
ZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCmZhbm90aWZ5Lmg6MzQ1OiBlcnJv
cjog4oCYRkFOX0NMT1NF4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9u
KQpmYW5vdGlmeS5oOjM0NTogZXJyb3I6IOKAmEZBTl9PUEVO4oCZIHVuZGVjbGFyZWQgKGZpcnN0
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQptYWtlOiAqKiogW2Zhbm90aWZ5MDJdIEVycm9yIDEKCktp
bmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=

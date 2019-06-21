Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E24664E5A6
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 12:14:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B883E3EAFF7
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 12:14:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B91C43EA26A
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 12:13:58 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B4BA81001348
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 12:13:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4E7C03082E20;
 Fri, 21 Jun 2019 10:13:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4626160852;
 Fri, 21 Jun 2019 10:13:56 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C4F33F6E4;
 Fri, 21 Jun 2019 10:13:56 +0000 (UTC)
Date: Fri, 21 Jun 2019 06:13:52 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1766730430.29482900.1561112032870.JavaMail.zimbra@redhat.com>
In-Reply-To: <1561110806-2734-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1561110806-2734-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.205.182, 10.4.195.6]
Thread-Topic: daemonlib.sh: call tty before executing service
Thread-Index: s6ZdzcE8D5dnpXW87wSh4fJJIgawBQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 21 Jun 2019 10:13:56 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] daemonlib.sh: call tty before executing service
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBPbiBteSBtYWNoaW5lLCBwb2xraXQtMC4x
MTItMjIuZWw3Lng4Nl82NCBoYXMgY29udGFpbmVkIHRoZSBbMV0gcGF0Y2guCj4gCj4gVGhpcyBw
YXRjaCBsZWFkcyBzZXJ2aWNlIGFjaXRvbnMoc3VjaCBhcyByZXN0YXJ0KSBkb24ndCBzdG9wIGlm
IGl0IGRvZXNuJ3QKPiBmaW5kIGNvbnRyb2xsaW5nIHRlcm1pbmFsLiBFdmVuIHRoZSBzZXJ2aWNl
IGhhcyBiZWVuIGV4ZWN1dGVkIHN1Y2Nlc3NmdWxseS4KPiBZb3UgY2FuIHJlcHJvZHVjZSBpdCB3
aXRoIHRoZSBmb2xsb3dpbmcgY29kZToKPiAKPiB0ZXN0LnNoCj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IGVjaG8gInJlc3RhcnQgZGFlbW9uIgo+IHN5
c3RlbWN0bCByZXN0YXJ0IHJzeXNsb2cuc2VydmljZSA+L2Rldi9udWxsIDI+JjEKPiBlY2hvICJy
ZXN0YXJ0IHN1Y2Nlc3MiCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+IC4vdGVzdC5zaCAmICAoaXQgZG9lc24ndCBzdG9wKQo+IHJlc3RhcnQgZGFlbW9u
Cj4gCj4gcHMgLWF1eGYKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+IC4uLi4gcHRzLzEgICAgVCAgICAgIFxfIC9iaW4vYmFzaCAuL3Rlc3Quc2gK
PiAuLi4uIHB0cy8xICAgIFQgICAgICAgIFxfIHN5c3RlbWN0bCByZXN0YXJ0IHJzeXNsb2cuc2Vy
dmljZQo+IC4uLi4gcHRzLzEgICAgVGwgICAgICAgICBcXyAvdXNyL2Jpbi9wa3R0eWFnZW50IC0t
bm90aWZ5LWZkIDYKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gCj4gL3Zhci9sb2cvc2VjdXJlCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gcG9sa2l0ZFsxMzEwXTogUmVnaXN0ZXJlZCBBdXRoZW50
aWNhdGlvbiBBZ2VudCBmb3IgdW5peC1wcm9jZXNzOjE4NDcyOjI1MjMyNQo+IChzeXN0ZW0gYnVz
IG5hbWUgOjEuMTA1IFsvdXNyL2Jpbi9wa3R0eWFnZW50IC0tbm90aWZ5LWZkIDYgLS1mYWxsYmFj
a10sCj4gb2JqZWN0Cj4gcGF0aCAvb3JnL2ZyZWVkZXNrdG9wL1BvbGljeUtpdDEvQXV0aGVudGlj
YXRpb25BZ2VudCwgbG9jYWxlIGVuX1VTLlVURi04KQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IFRoaXMgY2hhbmdlIGxlYWRzIHRvIHN5c2xv
Z1sxLTEwXSB0ZXN0Y2FzZSBoYW5nLiBJIGZpeCBpdCBieSBhZGRpbmcgdHR5Cj4gYmVmb3JjZQo+
IHNlcnZpY2UsIHNvIHRoZXNlIGNhc2VzIGRvbid0IGhhbmcuCgpCdWcgMTcxMTUzNiAtIHBvbGtp
dC0wLjExMi0yMi5lbDcgYnJlYWtzIHJlc3RhcnRpbmcgc2VydmljZXMgZnJvbSBiYWNrZ3JvdW5k
IHByb2Nlc3MKaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNzEx
NTM2CgpOb3Qgc3VyZSB0aG91Z2ggd2Ugc2hvdWxkIGJlIGFkZGluZyB3b3JrYXJvdW5kcyBmb3Ig
d2hhdCBzZWVtcyBsaWtlIGEgYnVnLgoKUmVnYXJkcywKSmFuCgo+IAo+IChwa3R0eWFnZW50OiBQ
b2xraXRBZ2VudFRleHRMaXN0ZW5lciBsZWF2ZXMgZWNobyB0dHkgZGlzYWJsZWQgaWYKPiBTSUdJ
TlQvU0lHVEVSTSkKPiBbMV1odHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvcG9sa2l0L3Bv
bGtpdC9jb21taXQvYmZiNzIyYmJlNWE1MDMwOTVjYzdlODYwZjI4MmIxNDJmNWFhNzVmMQo+IAo+
IFNpZ25lZC1vZmYtYnk6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+Cj4g
LS0tCj4gIHRlc3RjYXNlcy9saWIvZGFlbW9ubGliLnNoIHwgMjQgKysrKysrKysrKysrLS0tLS0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2xpYi9kYWVtb25saWIuc2ggYi90ZXN0Y2Fz
ZXMvbGliL2RhZW1vbmxpYi5zaAo+IGluZGV4IDBkZTNmODZhZi4uNTgwN2NiZWEwIDEwMDY0NAo+
IC0tLSBhL3Rlc3RjYXNlcy9saWIvZGFlbW9ubGliLnNoCj4gKysrIGIvdGVzdGNhc2VzL2xpYi9k
YWVtb25saWIuc2gKPiBAQCAtNDcsNDMgKzQ3LDQzIEBAIGZpCj4gIHN0YXJ0X2RhZW1vbigpCj4g
IHsKPiAgCWlmIFsgJEhBVkVfU1lTVEVNQ1RMIC1lcSAxIF07IHRoZW4KPiAtCQlzeXN0ZW1jdGwg
c3RhcnQgJDEuc2VydmljZSA+IC9kZXYvbnVsbCAyPiYxCj4gKwkJdHR5IHwgc3lzdGVtY3RsIHN0
YXJ0ICQxLnNlcnZpY2UgPiAvZGV2L251bGwgMj4mMQo+ICAJZWxpZiBjb21tYW5kIC12IHNlcnZp
Y2UgPi9kZXYvbnVsbCAyPiYxOyB0aGVuCj4gLQkJc2VydmljZSAkMSBzdGFydCA+IC9kZXYvbnVs
bCAyPiYxCj4gKwkJdHR5IHwgc2VydmljZSAkMSBzdGFydCA+IC9kZXYvbnVsbCAyPiYxCj4gIAll
bHNlCj4gLQkJL2V0Yy9pbml0LmQvJDEgc3RhcnQgPiAvZGV2L251bGwgMj4mMQo+ICsJCXR0eSB8
L2V0Yy9pbml0LmQvJDEgc3RhcnQgPiAvZGV2L251bGwgMj4mMQo+ICAJZmkKPiAgfQo+ICAKPiAg
c3RvcF9kYWVtb24oKQo+ICB7Cj4gIAlpZiBbICRIQVZFX1NZU1RFTUNUTCAtZXEgMSBdOyB0aGVu
Cj4gLQkJc3lzdGVtY3RsIHN0b3AgJDEuc2VydmljZSA+IC9kZXYvbnVsbCAyPiYxCj4gKwkJdHR5
IHwgc3lzdGVtY3RsIHN0b3AgJDEuc2VydmljZSA+IC9kZXYvbnVsbCAyPiYxCj4gIAllbGlmIGNv
bW1hbmQgLXYgc2VydmljZSA+L2Rldi9udWxsIDI+JjE7IHRoZW4KPiAtCQlzZXJ2aWNlICQxIHN0
b3AgPiAvZGV2L251bGwgMj4mMQo+ICsJCXR0eSB8IHNlcnZpY2UgJDEgc3RvcCA+IC9kZXYvbnVs
bCAyPiYxCj4gIAllbHNlCj4gLQkJL2V0Yy9pbml0LmQvJDEgc3RvcCA+IC9kZXYvbnVsbCAyPiYx
Cj4gKwkJdHR5IHwgL2V0Yy9pbml0LmQvJDEgc3RvcCA+IC9kZXYvbnVsbCAyPiYxCj4gIAlmaQo+
ICB9Cj4gIAo+ICBzdGF0dXNfZGFlbW9uKCkKPiAgewo+ICAJaWYgWyAkSEFWRV9TWVNURU1DVEwg
LWVxIDEgXTsgdGhlbgo+IC0JCXN5c3RlbWN0bCBpcy1hY3RpdmUgJDEuc2VydmljZSA+IC9kZXYv
bnVsbCAyPiYxCj4gKwkJdHR5IHwgc3lzdGVtY3RsIGlzLWFjdGl2ZSAkMS5zZXJ2aWNlID4gL2Rl
di9udWxsIDI+JjEKPiAgCWVsaWYgY29tbWFuZCAtdiBzZXJ2aWNlID4vZGV2L251bGwgMj4mMTsg
dGhlbgo+IC0JCXNlcnZpY2UgJDEgc3RhdHVzID4gL2Rldi9udWxsIDI+JjEKPiArCQl0dHkgfCBz
ZXJ2aWNlICQxIHN0YXR1cyA+IC9kZXYvbnVsbCAyPiYxCj4gIAllbHNlCj4gLQkJL2V0Yy9pbml0
LmQvJDEgc3RhdHVzID4gL2Rldi9udWxsIDI+JjEKPiArCQl0dHkgfCAvZXRjL2luaXQuZC8kMSBz
dGF0dXMgPiAvZGV2L251bGwgMj4mMQo+ICAJZmkKPiAgfQo+ICAKPiAgcmVzdGFydF9kYWVtb24o
KQo+ICB7Cj4gIAlpZiBbICRIQVZFX1NZU1RFTUNUTCAtZXEgMSBdOyB0aGVuCj4gLQkJc3lzdGVt
Y3RsIHJlc3RhcnQgJDEuc2VydmljZSA+IC9kZXYvbnVsbCAyPiYxCj4gKwkJdHR5IHwgc3lzdGVt
Y3RsIHJlc3RhcnQgJDEuc2VydmljZSA+IC9kZXYvbnVsbCAyPiYxCj4gIAllbGlmIGNvbW1hbmQg
LXYgc2VydmljZSA+L2Rldi9udWxsIDI+JjE7IHRoZW4KPiAtCQlzZXJ2aWNlICQxIHJlc3RhcnQg
PiAvZGV2L251bGwgMj4mMQo+ICsJCXR0eSB8IHNlcnZpY2UgJDEgcmVzdGFydCA+IC9kZXYvbnVs
bCAyPiYxCj4gIAllbHNlCj4gLQkJL2V0Yy9pbml0LmQvJDEgcmVzdGFydCA+IC9kZXYvbnVsbCAy
PiYxCj4gKwkJdHR5IHwgL2V0Yy9pbml0LmQvJDEgcmVzdGFydCA+IC9kZXYvbnVsbCAyPiYxCj4g
IAlmaQo+ICB9Cj4gLS0KPiAyLjE4LjEKPiAKPiAKPiAKPiAKPiAtLQo+IE1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo+IAoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F415B35606
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 06:45:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA3A03EA376
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 06:45:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 648643EA1EF
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 06:45:04 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0018110006C0
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 06:44:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 440D8308212A;
 Wed,  5 Jun 2019 04:45:00 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 805051001E86;
 Wed,  5 Jun 2019 04:44:59 +0000 (UTC)
Date: Wed, 5 Jun 2019 12:44:57 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it, chrubis@suse.cz
Message-ID: <20190605044457.egj3nnp574otnso6@XZHOUW.usersys.redhat.com>
References: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
 <20190528141214.18752-1-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528141214.18752-1-xzhou@redhat.com>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 05 Jun 2019 04:45:00 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 1/4] lib/tst_ioctl.c: add helper tst_fibmap
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

UGluZyBvbiB0aGlzIG9uZS4KClRoYW5rc34KCk9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDEwOjEy
OjExUE0gKzA4MDAsIE11cnBoeSBaaG91IHdyb3RlOgo+IFRvIGNoZWNrIGlmIEZJQk1BUCBpb2N0
bCBpcyBzdXBwb3J0ZWQgb24gdGhlIGZpbGVzeXN0ZW0gd2UgYXJlCj4gdGVzdGluZyBvbi4gSXQg
YWxzbyBjYW4gY2hlY2sgdGhlIHN1cHBvcnQgc3RhdHVzIG9mIHNwZWNpZmljCj4gZmlsZXMsIGJ1
dCB0aGF0IG1heSBub3QgbmVlZGVkIGZvciBub3cuCj4gCj4gU2lnbmVkLW9mZi1ieTogTXVycGh5
IFpob3UgPHh6aG91QHJlZGhhdC5jb20+Cj4gLS0tCj4gdjY6Cj4gICBNb2RpZnkgbWFrZV9zd2Fw
ZmlsZSgpIHRvIGNoZWNrIG1rc3dhcCBzdXBwb3J0IHN0YXR1cyBzYWZlbHkKPiAgIFJlbW92ZSB3
aGl0ZWxpc3QKPiAgIFJlbW92ZSBCVFJGUyBFSU5WQUwgY2hlY2sKPiAgIENoZWNrIG1rc3dhcCBz
dGF0dXMgYmVmb3JlIHRlc3Rpbmcgc3dhcG9uIGluIGhlbHBlcgo+ICAgSWYgc3dhcG9uIHBhc3Ms
IGZvbGxvd2luZyBzd2Fwb2ZmIGZhaWx1cmUgd2lsbCBmYWlsIHRoZSB3aG9sZSB0ZXN0IGFuZCBi
cmVhawo+ICAgQWxzbyBtb2RpZnkgc3dhcG9mZjAyIHRvIHJlbW92ZSB3aGl0ZWxpc3QgY29tcGxl
dGVseQo+IHY1Ogo+ICAgU3BsaXQgdG8gNCBwYXRjaGVzCj4gICBPbmx5IHRha2Ugb25lIGZpbGVu
YW1lIHBhcmFtZXRlciBpbiB0c3RfZmlibWFwCj4gICBBZGQgaGVscGVyIGlzX3N3YXBfc3VwcG9y
dGVkIHRvIGNoZWNrIHN3YXAgb3BlcmF0aW9uIHN1cHBvcnQgc3RhdHVzCj4gICBUZXN0IGZpYm1h
cC9zd2Fwb24gYW5kIHN3YXBvZmYgb3BlcmF0aW9uIGluIHRoZSBoZWxwZXIKPiAgIEtlZXAgTkZT
L1RNUEZTIHdoaXRlbGlzdAo+ICAgS2VlcCBCVFJGUyBFSU5WQUwgaGFuZGxpbmcgbG9naWMsIGV4
Y2VwdCBhYm92ZSAyIHNpdHVhdGlvbjoKPiAgICAgaWYgc3dhcG9uIGZhaWxzIGFuZCBmaWJtYXAg
aXMgbm90IHN1cHBvcnRlZCwgdHN0X2JyayB3aXRoIFRDT05GCj4gICAgIGlmIHN3YXBvbiBmYWls
cyBhbmQgZmlibWFwIGlzIHN1cHBvcnRlZCwgdHN0X2JyayB3aXRoIFRGQUlMCj4gICBJZiBzd2Fw
b24gdGVzdCBwYXNzIGluIHRoZSBoZWxwZXIsIHRlc3Qgc3dhcG9mZiBzaW1pbGFybHkKPiAgIFB1
dCBpc19zd2FwX3N1cHBvcnRlZCBoZWxwZXIgaW4gbGlic3dhcG9uLCBsaW5rIHN3YXBvZmYgYmlu
YXJpZXMgdG8gaXQKPiAgIE11dGUgYSBzcHJpbnRmIGZpbGFuYW1lIHdhbnJuaW5nIGJ5IHRoZSB3
YXkKPiB2NDoKPiAgIEZhaWwgc29mdGx5IGlmIEZJQk1BUCBuaXQgc3VwcG9ydGVkLCBpbnN0ZWFk
IG9mIHNraXAgZW50aXJlIHRlc3RjYXNlCj4gdjM6Cj4gICBGaXggZnNfdHlwZSB1bmRlY2xhcmVk
IGluIHN3YXBvZmYwMS5jCj4gdjI6Cj4gICBUZXN0IEZJQk1BUCBpbnN0ZWFkIG9mIGZzdHlwZSB3
aGl0ZWxpc3QKPiAKPiAgaW5jbHVkZS90c3RfZnMuaCB8ICA1ICsrKysrCj4gIGxpYi90c3RfaW9j
dGwuYyAgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3Rz
dF9pb2N0bC5jCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHN0X2ZzLmggYi9pbmNsdWRlL3Rz
dF9mcy5oCj4gaW5kZXggZWJjYTA2NWM2Li42ZDAzMzcxZWMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS90c3RfZnMuaAo+ICsrKyBiL2luY2x1ZGUvdHN0X2ZzLmgKPiBAQCAtMTc4LDYgKzE3OCwxMSBA
QCBjb25zdCBjaGFyICoqdHN0X2dldF9zdXBwb3J0ZWRfZnNfdHlwZXModm9pZCk7Cj4gICAqLwo+
ICB2b2lkIHRzdF9maWxsX2ZzKGNvbnN0IGNoYXIgKnBhdGgsIGludCB2ZXJib3NlKTsKPiAgCj4g
Ky8qCj4gKyAqIHRlc3QgaWYgRklCTUFQIGlvY3RsIGlzIHN1cHBvcnRlZAo+ICsgKi8KPiAraW50
IHRzdF9maWJtYXAoY29uc3QgY2hhciAqZmlsZW5hbWUpOwo+ICsKPiAgI2lmZGVmIFRTVF9URVNU
X0hfXwo+ICBzdGF0aWMgaW5saW5lIGxvbmcgdHN0X2ZzX3R5cGUoY29uc3QgY2hhciAqcGF0aCkK
PiAgewo+IGRpZmYgLS1naXQgYS9saWIvdHN0X2lvY3RsLmMgYi9saWIvdHN0X2lvY3RsLmMKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMC4uMzhhYTkzN2RiCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL2xpYi90c3RfaW9jdGwuYwo+IEBAIC0wLDAgKzEsMzcgQEAKPiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPiArCj4gKyNpbmNsdWRl
IDxlcnJuby5oPgo+ICsjaW5jbHVkZSA8c3RkaW8uaD4KPiArI2luY2x1ZGUgPHN0ZGxpYi5oPgo+
ICsjaW5jbHVkZSA8c3lzL2lvY3RsLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9mcy5oPgo+ICsKPiAr
I2RlZmluZSBUU1RfTk9fREVGQVVMVF9NQUlOCj4gKwo+ICsjaW5jbHVkZSAidHN0X3Rlc3QuaCIK
PiArCj4gK2ludCB0c3RfZmlibWFwKGNvbnN0IGNoYXIgKmZpbGVuYW1lKQo+ICt7Cj4gKwkvKiB0
ZXN0IGlmIEZJQk1BUCBpb2N0bCBpcyBzdXBwb3J0ZWQgKi8KPiArCWludCBmZCwgYmxvY2sgPSAw
Owo+ICsKPiArCWZkID0gb3BlbihmaWxlbmFtZSwgT19SRFdSIHwgT19DUkVBVCwgMDY2Nik7Cj4g
KwlpZiAoZmQgPCAwKSB7Cj4gKwkJdHN0X3JlcyhUV0FSTiB8IFRFUlJOTywKPiArCQkJICJvcGVu
KCVzLCBPX1JEV1IgfCBPX0NSRUFULCAwNjY2KSBmYWlsZWQiLCBmaWxlbmFtZSk7Cj4gKwkJcmV0
dXJuIDE7Cj4gKwl9Cj4gKwo+ICsJaWYgKGlvY3RsKGZkLCBGSUJNQVAsICZibG9jaykpIHsKPiAr
CQl0c3RfcmVzKFRJTkZPLCAiRklCTUFQIGlvY3RsIGlzIE5PVCBzdXBwb3J0ZWQiKTsKPiArCQlj
bG9zZShmZCk7Cj4gKwkJcmV0dXJuIDE7Cj4gKwl9Cj4gKwl0c3RfcmVzKFRJTkZPLCAiRklCTUFQ
IGlvY3RsIGlzIHN1cHBvcnRlZCIpOwo+ICsKPiArCWlmIChjbG9zZShmZCkpIHsKPiArCQl0c3Rf
cmVzKFRXQVJOIHwgVEVSUk5PLCAiY2xvc2UoZmQpIGZhaWxlZCIpOwo+ICsJCXJldHVybiAxOwo+
ICsJfQo+ICsJcmV0dXJuIDA7Cj4gK30KPiAtLSAKPiAyLjIxLjAKPiAKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

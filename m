Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F4042581
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 14:22:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BC1C3EAE2C
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 14:22:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 02C1F3EA6E0
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 14:22:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B56ED201210
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 14:22:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 46825AD3E;
 Wed, 12 Jun 2019 12:22:50 +0000 (UTC)
Date: Wed, 12 Jun 2019 14:22:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ammy Yi <ammy.yi@intel.com>
Message-ID: <20190612122243.GC4906@x230>
References: <20190604045343.32162-1-ammy.yi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604045343.32162-1-ammy.yi@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4 ltp] Add 4 more cases for Intel PT.
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

PiAxLiBBZGQgSW50ZWwgUFQgc2FucHNob3QgbW9kZSB0ZXN0Lgo+IDIuIEFkZCBJbnRlbCBQVCBl
eGNsdWRlIHVzZXIgdHJhY2UgbW9kZSB0ZXN0Lgo+IDMuIEFkZCBJbnRlbCBQVCBleGNsdWRlIGtl
cm5lbCB0cmFjZSBtb2RlIHRlc3QuCj4gNC4gQWRkIEludGVsIFBUIGRpc2FibGUgYnJhbmNoIHRy
YWNlIG1vZGUgdGVzdC4KCj4gU2lnbmVkLW9mZi1ieTogQW1teSBZaSA8YW1teS55aUBpbnRlbC5j
b20+Cj4gLS0tCj4gIHJ1bnRlc3QvdHJhY2luZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICA0ICsrCj4gIHRlc3RjYXNlcy9rZXJuZWwvdHJhY2luZy9wdF90ZXN0L3B0X3Rlc3QuYyB8IDcw
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYwIGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKPiBkaWZmIC0tZ2l0IGEvcnVudGVzdC90cmFj
aW5nIGIvcnVudGVzdC90cmFjaW5nCj4gaW5kZXggNTA0MTMyZDcwLi5kMjcwMGNhNTcgMTAwNjQ0
Cj4gLS0tIGEvcnVudGVzdC90cmFjaW5nCj4gKysrIGIvcnVudGVzdC90cmFjaW5nCj4gQEAgLTQs
MyArNCw3IEBAIGZ0cmFjZV9yZWdyZXNzaW9uMDIJZnRyYWNlX3JlZ3Jlc3Npb24wMi5zaAo+ICBm
dHJhY2Utc3RyZXNzLXRlc3QJZnRyYWNlX3N0cmVzc190ZXN0LnNoIDkwCj4gIGR5bmFtaWNfZGVi
dWcwMQkJZHluYW1pY19kZWJ1ZzAxLnNoCj4gIHB0X2Z1bGxfdHJhY2VfYmFzaWMgcHRfdGVzdAo+
ICtwdF9zbmFwc2hvdF90cmFjZV9iYXNpYyBwdF90ZXN0IC1tCj4gK3B0X2V4X3VzZXIgcHRfdGVz
dCAtZSB1c2VyCj4gK3B0X2V4X2tlcm5lbCBwdF90ZXN0IC1lIGtlcm5lbAo+ICtwdF9kaXNhYmxl
X2JyYW5jaCBwdF90ZXN0IC1iCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvdHJhY2lu
Zy9wdF90ZXN0L3B0X3Rlc3QuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvdHJhY2luZy9wdF90ZXN0L3B0
X3Rlc3QuYwo+IGluZGV4IDVmZWIxYWE2My4uMmNjNDRmMWE1IDEwMDY0NAo+IC0tLSBhL3Rlc3Rj
YXNlcy9rZXJuZWwvdHJhY2luZy9wdF90ZXN0L3B0X3Rlc3QuYwo+ICsrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvdHJhY2luZy9wdF90ZXN0L3B0X3Rlc3QuYwo+IEBAIC02LDE0ICs2LDE0IEBACj4gICAq
LwoKPiAgLyoKPiAtICogVGhpcyB0ZXN0IHdpbGwgY2hlY2sgaWYgSW50ZWwgUFQoSW50ZWwgUHJv
Y2Vzc2VyIFRyYWNlKSBmdWxsIHRyYWNlIG1vZGUgaXMKPiAtICogd29ya2luZy4KPiArICogVGhp
cyB0ZXN0IHdpbGwgY2hlY2sgaWYgSW50ZWwgUFQoSW50ZWwgUHJvY2Vzc2VyIFRyYWNlKSBpcyB3
b3JraW5nLgo+ICAgKgo+ICAgKiBJbnRlbCBDUFUgb2YgNXRoLWdlbmVyYXRpb24gQ29yZSAoQnJv
YWR3ZWxsKSBvciBuZXdlciBpcyByZXF1aXJlZCBmb3IgdGhlIHRlc3QuCj4gICAqCj4gICAqIGtj
b25maWcgcmVxdWlyZW1lbnQ6IENPTkZJR19QRVJGX0VWRU5UUwo+ICAgKi8KCj4gKwo+ICAjaW5j
bHVkZSA8c2NoZWQuaD4KPiAgI2luY2x1ZGUgPHN0ZGxpYi5oPgo+ICAjaW5jbHVkZSA8c3RkaW8u
aD4KPiBAQCAtNDAsMjIgKzQwLDM4IEBAIGludCBmZGUgPSAtMTsKPiAgLy9tYXAgaGVhZCBhbmQg
c2l6ZQo+ICB1aW50NjRfdCAqKmJ1Zm07Cj4gIGxvbmcgYnVoc3o7Cj4gK3N0YXRpYyBjaGFyICpz
dHJfbW9kZTsKPiArc3RhdGljIGNoYXIgKnN0cl9leGNsdWRlX2luZm87Cj4gK3N0YXRpYyBjaGFy
ICpzdHJfYnJhbmNoX2ZsYWc7Cj4gK2ludCBtb2RlID0gMTsKCj4gLXN0YXRpYyB1aW50NjRfdCAq
KmNyZWF0ZV9tYXAoaW50IGZkZSwgbG9uZyBidWZzaXplKQo+ICtzdGF0aWMgdWludDY0X3QgKipj
cmVhdGVfbWFwKGludCBmZGUsIGxvbmcgYnVmc2l6ZSwgaW50IGZsYWcpCj4gIHsKPiAgCXVpbnQ2
NF90ICoqYnVmX2V2Owo+ICsJaW50IHByb19mbGFnOwo+ICAJc3RydWN0IHBlcmZfZXZlbnRfbW1h
cF9wYWdlICpwYzsKCj4gIAlidWZfZXYgPSBTQUZFX01BTExPQygyKnNpemVvZih1aW50NjRfdCAq
KSk7Cj4gIAlidWZfZXZbMF0gPSBOVUxMOwo+ICAJYnVmX2V2WzFdID0gTlVMTDsKPiAtCWJ1Zl9l
dlswXSA9IFNBRkVfTU1BUChOVUxMLCBJTlRFTF9QVF9NRU1TSVpFLCBQUk9UX1JFQUQgfCBQUk9U
X1dSSVRFLAo+ICsJaWYgKGZsYWcgPT0gMSkgewo+ICsJCXRzdF9yZXMoVElORk8sICJtZW1vcnkg
d2lsbCBiZSByL3cgZm9yIGZ1bGwgdHJhY2UgbW9kZSEiKTsKPiArCQlwcm9fZmxhZyA9IFBST1Rf
UkVBRCB8IFBST1RfV1JJVEU7Cj4gKwl9IGVsc2Ugewo+ICsJCXRzdF9yZXMoVElORk8sICJtZW1v
cnkgd2lsbCBiZSByIG9ubHkgZm9yIHNuYXBzaG90IG1vZGUhIik7Cj4gKwkJcHJvX2ZsYWcgPSBQ
Uk9UX1JFQUQ7Cj4gKwl9Cj4gKwlidWZfZXZbMF0gPSBTQUZFX01NQVAoZmRlLCBJTlRFTF9QVF9N
RU1TSVpFLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAo+ICAJCQkJCQkJTUFQX1NIQVJFRCwgZmRl
LCAwKTsKCi4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X3NhZmVfbWFjcm9zLmg6MjU1OjMyOiB3YXJu
aW5nOiBwYXNzaW5nIGFyZ3VtZW50IDMgb2Yg4oCYc2FmZV9tbWFw4oCZIG1ha2VzIHBvaW50ZXIg
ZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFstV2ludC1jb252ZXJzaW9uXQogIHNhZmVfbW1h
cChfX0ZJTEVfXywgX19MSU5FX18sIChhZGRyKSwgKGxlbmd0aCksIChwcm90KSwgXAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fgpwdF90ZXN0LmM6NjQ6MTQ6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhTQUZFX01NQVDigJkKICBidWZfZXZbMF0gPSBTQUZFX01N
QVAoZmRlLCBJTlRFTF9QVF9NRU1TSVpFLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAogICAgICAg
ICAgICAgIF5+fn5+fn5+fgouLi8uLi8uLi8uLi9pbmNsdWRlL3RzdF9zYWZlX21hY3Jvcy5oOjI0
MDozNzogbm90ZTogZXhwZWN0ZWQg4oCYdm9pZCAq4oCZIGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBl
IOKAmGludOKAmQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqYWRkciwgc2l6
ZV90IGxlbmd0aCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fl5+fn4KQWxz
byBkaWRuJ3QgZ2V0IHdoeSAxc3QgcGFyYW1ldGVyIGlzbid0IE5VTEwuCkJUVyB0aGVyZSBpcyBh
IGZ1bmN0aW9uIChpZiBpdCBoZWxwcywgcHJvYmFibHkgbm90KToKdm9pZCAqdHN0X2dldF9iYWRf
YWRkcih2b2lkICgqY2xlYW51cF9mbikgKHZvaWQpKTsKCi4uLgoKPiArCWF0dHIuZXhjbHVkZV9r
ZXJuZWwJPSAwOwo+ICsJYXR0ci5leGNsdWRlX3VzZXIJPSAwOwo+ICsKPiArCWlmIChzdHJfZXhj
bHVkZV9pbmZvICYmICFzdHJjbXAoc3RyX2V4Y2x1ZGVfaW5mbywgInVzZXIiKSkgewo+ICsJCXRz
dF9yZXMoVElORk8sICJJbnRlbCBQVCB3aWxsIGV4Y2x1ZGUgdXNlciB0cmFjZS4iKTsKPiArCQlh
dHRyLmV4Y2x1ZGVfdXNlciA9IDE7Cj4gKwl9Cj4gKwlpZiAoc3RyX2V4Y2x1ZGVfaW5mbyAmJiAh
c3RyY21wKHN0cl9leGNsdWRlX2luZm8sICJrZXJuZWwiKSkgewo+ICsJCXRzdF9yZXMoVElORk8s
ICJJbnRlbCBQVCB3aWxsIGV4Y2x1ZGUga2VybmVsIHRyYWNlLiIpOwo+ICsJCWF0dHIuZXhjbHVk
ZV9rZXJuZWwgPSAxOwo+ICsJfQoKQ29kZSBDeXJpbCBzdWdnZXN0ZWQgaW4gdjMgaXMgcmVhbGx5
IGJldHRlciAoYnV0IHRoaXMgY291bGQgYmUgZml4ZWQKZHVyaW5nIG1lcmdpbmcpOgoJaWYgKHN0
cl9leGNsdWRlKSB7CgkJaWYgKCFzdHJjbXAoc3RyX2V4Y2x1ZGUsICJ1c2VyIikpIHsKCQkJdHN0
X3JlcyhUSU5GTywgIkV4Y2x1ZGluZyB1c2VyIHRyYWNlIik7CgkJCWF0dHIuZXhjbHVkZV91c2Vy
ID0gMTsKCQl9IGVsc2UgaWYgKCFzdHJjbXAoc3RyX2V4Y2x1ZGUsICJrZXJuZWwiKSkgewoJCQl0
c3RfcmVzKFRJTkZPLCAiRXhjbHVkaW5nIGtlcm5lbCB0cmFjZSIpOwoJCQlhdHRyLmV4Y2x1ZGVf
a2VybmVsID0gMTsKCQl9IGVsc2UgewoJCQl0c3RfYnJrKFRCUk9LLCAiSW52YWxpZCAtZSAnJXMn
Iiwgc3RyX2V4Y2x1ZGUpOwoJCX0KCX0KCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

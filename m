Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1951ED7F1F
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 20:37:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C140E3C2307
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 20:37:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 28D913C2092
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 18:00:45 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id DB8171A0122F
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 18:00:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CCD128;
 Tue, 15 Oct 2019 09:00:42 -0700 (PDT)
Received: from [10.37.12.83] (unknown [10.37.12.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 576CE3F68E;
 Tue, 15 Oct 2019 09:00:39 -0700 (PDT)
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <cki.B4A567748F.PFM8G4WKXI@redhat.com>
 <805988176.6044584.1571038139105.JavaMail.zimbra@redhat.com>
 <CAAeHK+zxFWvCOgTYrMuD-oHJAFMn5DVYmQ6-RvU8NrapSz01mQ@mail.gmail.com>
 <20191014162651.GF19200@arrakis.emea.arm.com>
 <20191014213332.mmq7narumxtkqumt@willie-the-truck>
 <20191015152651.GG13874@arrakis.emea.arm.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <342a9218-d840-f56d-2349-a5cfaafb6e16@arm.com>
Date: Tue, 15 Oct 2019 17:02:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015152651.GG13874@arrakis.emea.arm.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 15 Oct 2019 20:36:58 +0200
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E0-rc2-d6c2c23=2Ecki_=28stable-next=29?=
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
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 Dave P Martin <Dave.Martin@arm.com>, CKI Project <cki-project@redhat.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ2F0YWxpbiwKCk9uIDEwLzE1LzE5IDQ6MjYgUE0sIENhdGFsaW4gTWFyaW5hcyB3cm90ZToK
PiBBZGRpbmcgU3phYm9sY3MgYW5kIERhdmUgZnJvbSBBUk0gYXMgd2UndmUgZGlzY3Vzc2VkIHRo
aXMgaW50ZXJuYWxseQo+IGJyaWVmbHkgYnV0IHdlIHNob3VsZCBpbmNsdWRlIHRoZSB3aWRlciBh
dWRpZW5jZS4KPiAKPiBPbiBNb24sIE9jdCAxNCwgMjAxOSBhdCAxMDozMzozMlBNICswMTAwLCBX
aWxsIERlYWNvbiB3cm90ZToKPj4gT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDU6MjY6NTFQTSAr
MDEwMCwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOgo+Pj4gT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQg
MDI6NTQ6MTdQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPj4+PiBPbiBNb24sIE9j
dCAxNCwgMjAxOSBhdCA5OjI5IEFNIEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPiB3
cm90ZToKPj4+Pj4+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSByZWNlbnQgY29tbWl0IGZy
b20gdGhpcyBrZXJuZWwgdHJlZToKPj4+Pj4+Cj4+Pj4+PiAgICAgICAgS2VybmVsIHJlcG86Cj4+
Pj4+PiAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3Nhc2hhbC9saW51eC1zdGFibGUuZ2l0Cj4+Pj4+PiAgICAgICAgICAgICBDb21taXQ6IGQ2YzJj
MjNhMjlmNCAtIE1lcmdlIGJyYW5jaCAnc3RhYmxlLW5leHQnIG9mCj4+Pj4+PiAgICAgICAgICAg
ICBzc2g6Ly9jaHViYnlib3g6L2hvbWUvc2FzaGEvZGF0YS9uZXh0IGludG8gc3RhYmxlLW5leHQK
Pj4+Pj4+Cj4+Pj4+PiBUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHBy
b3ZpZGVkIGJlbG93Lgo+Pj4+Pj4KPj4+Pj4+ICAgICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChz
ZWUgZGV0YWlscyBiZWxvdykKPj4+Pj4+ICAgICAgICAgICAgICBNZXJnZTogT0sKPj4+Pj4+ICAg
ICAgICAgICAgQ29tcGlsZTogT0sKPj4+Pj4+ICAgICAgICAgICAgICBUZXN0czogRkFJTEVECj4+
Pj4+Pgo+Pj4+Pj4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9ncyBh
cmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZCBoZXJlOgo+Pj4+Pj4KPj4+Pj4+ICAgaHR0cHM6Ly9h
cnRpZmFjdHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8yMjM1NjMKPj4+Pj4+Cj4+Pj4+PiBP
bmUgb3IgbW9yZSBrZXJuZWwgdGVzdHMgZmFpbGVkOgo+Pj4+Pj4KPj4+Pj4+ICAgICBhYXJjaDY0
Ogo+Pj4+Pj4gICAgICAg4p2MIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGUKPj4+Pj4+Cj4+Pj4+
Cj4+Pj4+IFRlc3QgWzFdIGlzIHBhc3NpbmcgdmFsdWUgY2xvc2UgdG8gTE9OR19NQVgsIHdoaWNo
IG9uIGFybTY0IGlzIG5vdyB0cmVhdGVkIGFzIHRhZ2dlZCB1c2Vyc3BhY2UgcHRyOgo+Pj4+PiAg
IDA1N2QzMzg5MTA4ZSAoIm1tOiB1bnRhZyB1c2VyIHBvaW50ZXJzIHBhc3NlZCB0byBtZW1vcnkg
c3lzY2FsbHMiKQo+Pj4+Pgo+Pj4+PiBBbmQgbm93IHNlZW1zIHRvIGhpdCBvdmVyZmxvdyBjaGVj
ayBhZnRlciBzaWduIGV4dGVuc2lvbiAoRUlOVkFMKS4KPj4+Pj4gVGVzdCBzaG91bGQgcHJvYmFi
bHkgZmluZCBkaWZmZXJlbnQgd2F5IHRvIGNob29zZSBpbnZhbGlkIHBvaW50ZXIuCj4+Pj4+Cj4+
Pj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9ibG9iL21h
c3Rlci90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvY29uZm9ybWFuY2UvaW50ZXJmYWNl
cy9tbG9jay84LTEuYwo+Pj4+CgpbLi4uXQoKPj4+IFRoZSBvcHRpb25zIEkgc2VlOgo+Pj4KPj4+
IDEuIFJldmVydCBjb21taXQgMDU3ZDMzODkxMDhlIGFuZCB0cnkgYWdhaW4gdG8gZG9jdW1lbnQg
dGhhdCB0aGUgbWVtb3J5Cj4+PiAgICBzeXNjYWxscyBkbyBub3Qgc3VwcG9ydCB0YWdnZWQgcG9p
bnRlcnMKPj4+Cj4+PiAyLiBDaGFuZ2UgdW50YWdnZWRfYWRkcigpIHRvIG9ubHkgMC1leHRlbmQg
ZnJvbSBiaXQgNTUgb3IgbGVhdmUgdGhlCj4+PiAgICB0YWcgdW5jaGFuZ2VkIGlmIGJpdCA1NSBp
cyAxLiBXZSBjb3VsZCBtYXNrIG91dCB0aGUgdGFnICgwIHJhdGhlcgo+Pj4gICAgdGhhbiBzaWdu
LWV4dGVuZCkgYnV0IGlmIHdlIGhhZCBhbiBtbG9jayB0ZXN0IHBhc3NpbmcgVUxPTkdfTUFTSywK
Pj4+ICAgIHRoZW4gd2UgZ2V0IC1FTk9NRU0gaW5zdGVhZCBvZiAtRUlOVkFMCj4+Pgo+Pj4gMy4g
TWFrZSB1bnRhZ2dlZF9hZGRyKCkgZGVwZW5kIG9uIHRoZSBUSUZfVEFHR0VEX0FERFIgYml0IGFu
ZCB3ZSBvbmx5Cj4+PiAgICBicmVhayB0aGUgQUJJIGZvciBhcHBsaWNhdGlvbnMgb3B0aW5nIGlu
IHRvIHRoaXMgbmV3IEFCSS4gV2UgZGlkIGxvb2sKPj4+ICAgIGF0IHRoaXMgYnV0IHRoZSBwdHJh
Y2UoUEVFSy9QT0tFX0RBVEEpIG5lZWRzIGEgYml0IG1vcmUgdGhpbmtpbmcgb24KPj4+ICAgIHdo
ZXRoZXIgd2UgY2hlY2sgdGhlIHB0cmFjZSdkIHByb2Nlc3Mgb3IgdGhlIGRlYnVnZ2VyIGZsYWdz
Cj4+Pgo+Pj4gNC4gTGVhdmUgdGhpbmdzIGFzIHRoZXkgYXJlLCBjb25zaWRlciB0aGUgYWRkcmVz
cyBzcGFjZSA1Ni1iaXQgYW5kCj4+PiAgICBjaGFuZ2UgdGhlIHRlc3QgdG8gbm90IHVzZSBMT05H
X01BWCBvbiBhcm02NC4gVGhpcyBuZWVkcyB0byBiZSBwYXNzZWQKPj4+ICAgIGJ5IHRoZSBzcGFy
YyBndXlzIHNpbmNlIHRoZXkgcHJvYmFibHkgaGF2ZSBhIHNpbWlsYXIgaXNzdWUKPj4KPj4gSSdt
IGluIGZhdm91ciBvZiAoMikgb3IgKDQpIGFzIGxvbmcgYXMgdGhlcmUncyBhbHNvIGFuIHVwZGF0
ZSB0byB0aGUgZG9jcy4KPiAKPiBXaXRoICg0KSB3ZSdkIHN0YXJ0IGRpZmZlcmluZyBmcm9tIG90
aGVyIGFyY2hpdGVjdHVyZXMgc3VwcG9ydGVkIGJ5Cj4gTGludXguIFRoaXMgd29ya3MgaWYgd2Ug
Y29uc2lkZXIgdGhlIHRlc3QgdG8gYmUgYnJva2VuLiBIb3dldmVyLCByZWFkaW5nCj4gdGhlIG1s
b2NrIG1hbiBwYWdlOgo+IAo+ICAgICAgICBFSU5WQUwgVGhlIHJlc3VsdCBvZiB0aGUgYWRkaXRp
b24gYWRkcitsZW4gd2FzIGxlc3MgdGhhbiBhZGRyCj4gICAgICAgIChlLmcuLCB0aGUgYWRkaXRp
b24gbWF5IGhhdmUgcmVzdWx0ZWQgaW4gYW4gb3ZlcmZsb3cpLgo+IAo+ICAgICAgICBFTk9NRU0g
U29tZSBvZiB0aGUgc3BlY2lmaWVkIGFkZHJlc3MgcmFuZ2UgZG9lcyBub3QgY29ycmVzcG9uZCB0
bwo+ICAgICAgICBtYXBwZWQgcGFnZXMgaW4gdGhlIGFkZHJlc3Mgc3BhY2Ugb2YgdGhlIHByb2Nl
c3MuCj4gCj4gVGhlcmUgaXMgbm8gbWVudGlvbiBvZiBFSU5WQUwgb3V0c2lkZSB0aGUgVEFTS19T
SVpFLCBzZWVtcyB0byBmYWxsIG1vcmUKPiB3aXRoaW4gdGhlIEVOT01FTSBkZXNjcmlwdGlvbiBh
Ym92ZS4KPgoKSSBhZ3JlZSB3aXRoIHlvdXIgYW5hbHlzaXMgYW5kIHZvdGUgZm9yIG9wdGlvbiAo
MikgYXMgd2VsbCwgYmVjYXVzZSBvZiB3aGF0IHlvdQpyZXBvcnRlZCBhYm91dCBtbG9jaygpIGVy
cm9yIG1lYW5pbmdzIGFuZCBiZWNhdXNlIGJlaW5nIHRoaXMgQUJJIEkgd291bGQgcHJlZmVyCndo
ZXJlIHBvc3NpYmxlIHRvIG5vdCBkaXZlcmdlIGZyb20gb3RoZXIgYXJjaGl0ZWN0dXJlcy4KIFsu
Li5dCgotLSAKUmVnYXJkcywKVmluY2Vuem8KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

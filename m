Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF55015542
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 23:09:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC5AB3EAE75
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 23:09:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8C6433EA37C
 for <ltp@lists.linux.it>; Mon,  6 May 2019 23:09:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 270511400E44
 for <ltp@lists.linux.it>; Mon,  6 May 2019 23:09:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18ACAAC15
 for <ltp@lists.linux.it>; Mon,  6 May 2019 21:09:23 +0000 (UTC)
Date: Mon, 6 May 2019 23:09:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190506210921.GB9828@dell5510>
References: <20190425085204.11036-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190425085204.11036-1-camann@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/rt_sigqueueinfo01: rewrote testcase
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

SGkgQ2hyaXN0aWFuLAoKPiBUaGUgcHJldmlvdXMgaW1wbGVtZW50YXRpb24gb25seSB0ZXN0ZWQg
aWYgdGhlIHN5c2NhbGwgY2FuCj4gYmUgY2FsbGVkIGF0IGFsbC4gTm93IGl0IGFsc28gY2hlY2tz
IGlmIHRoZSBjb3JyZWN0IHNpZ25hbAo+IGFuZCBkYXRhIGlzIHNlbnQgYW5kIHJlY2VpdmVkLgoK
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQW1hbm4gPGNhbWFubkBzdXNlLmNvbT4KUmV2aWV3
ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgoKVGhhbmtzIGZvciB5b3VyIHBhdGNo
LgpNaW5vciBjb21tZW50cywgbm90IHJlbGV2YW50IHRvIHRoZSBhY3R1YWwgdGVzdGluZyBiZWxv
dy4KCktpbmQgcmVnYXJkcywKUGV0cgoKPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9ydF9z
aWdxdWV1ZWluZm8vTWFrZWZpbGUgfCAgIDIgKwo+ICAuLi4vc3lzY2FsbHMvcnRfc2lncXVldWVp
bmZvL3J0X3NpZ3F1ZXVlaW5mby5oICAgICB8ICAyMiArKysKPiAgLi4uL3N5c2NhbGxzL3J0X3Np
Z3F1ZXVlaW5mby9ydF9zaWdxdWV1ZWluZm8wMS5jICAgfCAxODggKysrKysrKysrKystLS0tLS0t
LS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTI1IGluc2VydGlvbnMoKyksIDg3IGRlbGV0aW9ucygt
KQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9ydF9zaWdx
dWV1ZWluZm8vcnRfc2lncXVldWVpbmZvLmgKCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvcnRfc2lncXVldWVpbmZvL01ha2VmaWxlIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9ydF9zaWdxdWV1ZWluZm8vTWFrZWZpbGUKPiBpbmRleCAyZWY4NmYwNmYuLjQ5OGJh
OGUzMSAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3J0X3NpZ3F1ZXVl
aW5mby9NYWtlZmlsZQo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcnRfc2lncXVl
dWVpbmZvL01ha2VmaWxlCj4gQEAgLTIxLDMgKzIxLDUgQEAgdG9wX3NyY2RpcgkJPz0gLi4vLi4v
Li4vLi4KPiAgaW5jbHVkZSAkKHRvcF9zcmNkaXIpL2luY2x1ZGUvbWsvdGVzdGNhc2VzLm1rCgo+
ICBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0Lm1r
Cj4gKwo+ICtydF9zaWdxdWV1ZWluZm8wMTogQ0ZMQUdTICs9IC1wdGhyZWFkCj4gZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcnRfc2lncXVldWVpbmZvL3J0X3NpZ3F1ZXVl
aW5mby5oIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9ydF9zaWdxdWV1ZWluZm8vcnRfc2ln
cXVldWVpbmZvLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMC4uOTI3
ZTRiZjNiCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
cnRfc2lncXVldWVpbmZvL3J0X3NpZ3F1ZXVlaW5mby5oCkRvIHlvdSBwbGFuIHRvIGFkZCBtb3Jl
IHJ0X3NpZ3F1ZXVlaW5mbygpIHRlc3RzPyBPdGhlcndpc2Ugd2UgbWlnaHQganVzdCBhZGQKdGhp
cyBjb250ZW50IGludG8gQyBmaWxlLgoKPiBAQCAtMCwwICsxLDIyIEBACj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCj4gKy8qCj4gKyAqIENvcHlyaWdodCAo
YykgMjAxOSBTVVNFIExMQwo+ICsgKiBBdXRob3I6IENocmlzdGlhbiBBbWFubiA8Y2FtYW5uQHN1
c2UuY29tPgo+ICsgKi8KPiArCj4gKyNpZmRlZiBIQVZFX1NUUlVDVF9TSUdBQ1RJT05fU0FfU0lH
QUNUSU9OCkFsc28gSSdkIHVzZSB0aGlzIGd1YXJkIG9ubHkgaW4gQyBmaWxlIChJTUhPIG5vdCBy
ZXF1aXJlZCBmb3IgaGVhZGVyKSBhbmQgbG9hZAp0aGlzIGhlYWRlciBhZnRlciB0aGlzIGd1YXJk
LgoKPiArCj4gKyNpZm5kZWYgX19SVF9TSUdRVUVVRUlORk9fSF9fCj4gKyNkZWZpbmUgX19SVF9T
SUdRVUVVRUlORk9fSF9fCj4gKwo+ICsjZGVmaW5lIGdldHRpZCgpIHN5c2NhbGwoU1lTX2dldHRp
ZCkKSSBndWVzcyB0aGlzIGRvZXMgbm90IGNsYXNoIGV2ZW4gd2l0aCBnbGliYyAyLjMwLCB3aGlj
aCBhZGRlZCBnZXR0aWQoKSwgYmVjYXVzZQp3ZSBkb24ndCBpbmNsdWRlIDxzeXMvdHlwZXMuaD4u
IEJ1dCBJIHdvbmRlciBpZiBpdCdzIHVzZWZ1bCB0byBkZWZpbmUgZm9yIG9uZSB1c2FnZS4KQlRX
IHdlIGhhdmUgMjIge3RzdF8sfXN5c2NhbGwoX19OUl9nZXR0aWQpIHVzYWdlcywgMiBkZWZpbml0
aW9ucyBsaWtlIHlvdXIKKCNkZWZpbmUgZ2V0dGlkKCkgc3lzY2FsbChfX05SX2dldHRpZCkpIGFu
ZCA0IGludCBnZXR0aWQodm9pZCkgZnVuY3Rpb25zLgpJZiBjb25zaWRlcmVkIHVzZWZ1bCwgaXQg
c2hvdWxkIGJlIGluIGluY2x1ZGUvbGFwaS8uCgouLi4KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPiArLyoKPiArICogQ29weXJpZ2h0IChjKSAyMDE5IFNV
U0UgTExDCj4gKyAqIEF1dGhvcjogQ2hyaXN0aWFuIEFtYW5uIDxjYW1hbm5Ac3VzZS5jb20+Cj4g
KyAqLwo+ICsKPiArLyoKPiArICogRGVzY3JpcHRpb246CllvdSBjYW4gYmUgbW9yZSByYWRpY2Fs
IHdpdGggZG9jIGNsZWFudXAuICJEZXNjcmlwdGlvbjoiIG9yIHJlZHVuZGFudCBsaW5lIGJlZm9y
ZSAqLyBjYW4gZ28gYXdheS4KCj4gKyAqCj4gKyAqIFRoaXMgdGVzdHMgdGhlIHJ0X3NpZ3F1ZXVl
aW5mbygpIHN5c2NhbGwuCj4gKyAqCj4gKyAqIEl0IGRvZXMgc28gYnkgY3JlYXRpbmcgYSB0aHJl
YWQgd2hpY2ggcmVnaXN0ZXJzIHRoZSBjb3JyZXNwb25kaW5nCj4gKyAqIHNpZ25hbCBoYW5kbGVy
LiBBZnRlciB0aGF0IHRoZSBtYWluIHRocmVhZCBzZW5kcyBhIHNpZ25hbCBhbmQgZGF0YQo+ICsg
KiB0byB0aGUgaGFuZGxlciB0aHJlYWQuIElmIHRoZSBjb3JyZWN0IHNpZ25hbCBhbmQgZGF0YSBp
cyByZWNlaXZlZCwKPiArICogdGhlIHRlc3QgaXMgc3VjY2Vzc2Z1bC4KPiArICoKPiArICovCgpL
aW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK

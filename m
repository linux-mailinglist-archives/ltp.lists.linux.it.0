Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D291DDC99
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 03:23:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C61773C4D74
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 03:23:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7D3813C0EC2
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:23:37 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 870381400E1D
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:23:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590110614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vxudY156bGCRdGQZK/MPi1qa0K7X2Wo/ADt6HCYgEjc=;
 b=C8QVqf9w+tCs2UyxHAyngkK+P9GIf4DUNygzn2d2OYFsuQbKPooHLzEFeDMJM4VFz9sXQm
 pKz/mCdVUm7RTg7t7cttv1CuUk+aCSCYl/7ygRAGq4HhOek2fFw19UeMqEKHgDQjpAPbiL
 Gh5DPct6ASemhGl0Po4Fv7Zz82jSH9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-uWKfyys5NPGyM0vBXng_kQ-1; Thu, 21 May 2020 21:23:31 -0400
X-MC-Unique: uWKfyys5NPGyM0vBXng_kQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 559A618FE889
 for <ltp@lists.linux.it>; Fri, 22 May 2020 01:23:30 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A0341C950
 for <ltp@lists.linux.it>; Fri, 22 May 2020 01:23:28 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 09:23:24 +0800
Message-Id: <20200522012327.18991-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH RFC 1/4] lib: add new cgroup test API
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

TWFueSBvZiBvdXIgTFRQIHRlc3RzIG5lZWQgQ29udHJvbCBHcm91cCBpbiB0aGUgY29uZmlndXJh
dGlvbiwKdGhpcyBwYXRjaCBtYWtlcyBjZ3JvdXAgdW5pZmllZCBtb3VudGluZyBhdCBzZXR1cCBw
aGFzZSB0byBiZQpwb3NzaWJsZS4gVGhlIG1ldGhvZMKgaXMgZXh0cmFjdGVkIGZyb20gbWVtLmgg
d2l0aCB0aGUgcHVycG9zZQpvZsKgZXh0ZW5kaWJsZSBmb3IgZnVydGhlciBkZXZlbG9waW5nLCBh
bmQgdHJ5aW5nwqB0byBjb21wYXRpYmxlCnRoZSBjdXJyZW50IHR3byB2ZXJzaW9ucyBvZiBjZ3Jv
dXAsCgpJdCdzIGhhcmQgdG8gbWFrZSBhbGwgQVBJcyBiZSBzdHJpY3RseSBjb25zaXN0ZW50IGJl
Y2F1c2UgdGhlcmUKYXJlIG1hbnkgZGlmZmVyZW5jZXMgYmV0d2VlbiB2MSBhbmQgdjIuIEJ1dCBp
dMKgY2Fwc3VsYXRlIHRoZSBkZXRhaWwKb2YgY2dyb3VwIG1vdW50aW5nIGluIGhpZ2gtbGV2ZWwg
ZnVuY3Rpb25zLCB3aGljaCB3aWxsIGJlIGVhc2llcgp0byB1c2UgY2dyb3VwIHdpdGhvdXQgY29u
c2lkZXJpbmcgdG9vIG11Y2ggdGVjaG5pY2FsIHRoaW5nLsKgIMKgCgpCdHcsIHRlc3QgZ2V0IHBh
c3NlZCBvbiBSSEVMNyh4ODZfNjQpLCBSSEVMOChwcGM2NGxlKSwgRmVkb3JhMzIoeDg2XzY0KS4K
ClNpZ25lZC1vZmYtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUv
dHN0X2Nncm91cC5oIHwgMTA4ICsrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL3RzdF90ZXN0
LmggICB8ICAgMSArCiBsaWIvdHN0X2Nncm91cC5jICAgICB8IDIzMiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDM0MSBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS90c3RfY2dyb3VwLmgKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBsaWIvdHN0X2Nncm91cC5jCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS90c3RfY2dy
b3VwLmggYi9pbmNsdWRlL3RzdF9jZ3JvdXAuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAuLjc4ZTY0NmMyZQotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvdHN0X2Nncm91
cC5oCkBAIC0wLDAgKzEsMTA4IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vci1sYXRlcgorLyoKKyAqIENvcHlyaWdodCAoYykgMjAyMCBSZWQgSGF0LCBJbmMuCisgKi8K
KworI2lmbmRlZiBUU1RfQ0dST1VQX0gKKyNkZWZpbmUgVFNUX0NHUk9VUF9ICisKKyNkZWZpbmUg
UEFUSF9TWVNfQ0dST1VQCQkiL3N5cy9mcy9jZ3JvdXAiCisKK2VudW0gdHN0X2Nncm91cF92ZXIg
eworCVRTVF9DR1JPVVBfVjEgPSAxLAorCVRTVF9DR1JPVVBfVjIgPSAyLAorfTsKKworc3RhdGlj
IGVudW0gdHN0X2Nncm91cF92ZXIgdHN0X2NnX3ZlcjsKKworZW51bSB0c3RfY2dyb3VwX3ZlciB0
c3RfY2dyb3VwX3ZlcnNpb24odm9pZCk7CisKKy8qIGNncm91cCB2MSAqLworI2RlZmluZSBQQVRI
X1RNUF9DRzFfTUVNCSIvdG1wL2Nncm91cDFfbWVtIgorI2RlZmluZSBQQVRIX1RNUF9DRzFfQ1NU
CSIvdG1wL2Nncm91cDFfY3B1c2V0IgorI2RlZmluZSBQQVRIX0NHMV9NRU1fTFRQCVBBVEhfVE1Q
X0NHMV9NRU0gIi9sdHAiCisjZGVmaW5lIFBBVEhfQ0cxX0NTVF9MVFAJUEFUSF9UTVBfQ0cxX0NT
VCAiL2x0cCIKKyNkZWZpbmUgUEFUSF9NRU1PUllfTElNSVQJUEFUSF9DRzFfTUVNX0xUUCAiL21l
bW9yeS5saW1pdF9pbl9ieXRlcyIKKyNkZWZpbmUgUEFUSF9NRU1PUllfU1dfTElNSVQJUEFUSF9D
RzFfTUVNX0xUUCAiL21lbW9yeS5tZW1zdy5saW1pdF9pbl9ieXRlcyIKKwordm9pZCB0c3RfbW91
bnRfY2dyb3VwMShjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICpvcHRpb24sCisJCQljb25z
dCBjaGFyICptbnRfcGF0aCwgY29uc3QgY2hhciAqbmV3X3BhdGgpOwordm9pZCB0c3RfdW1vdW50
X2Nncm91cDEoY29uc3QgY2hhciAqbW50X3BhdGgsIGNvbnN0IGNoYXIgKm5ld19wYXRoKTsKKwor
dm9pZCB0c3RfbW91bnRfbWVtY2cxKHZvaWQpOwordm9pZCB0c3RfdW1vdW50X21lbWNnMSh2b2lk
KTsKK3ZvaWQgdHN0X3dyaXRlX21lbWNnMShsb25nIG1lbXN6KTsKKwordm9pZCB0c3RfbW91bnRf
Y3B1c2V0Y2cxKHZvaWQpOwordm9pZCB0c3RfdW1vdW50X2NwdXNldGNnMSh2b2lkKTsKK3ZvaWQg
dHN0X3dyaXRlX2NwdXNldGNnMSh2b2lkKTsKKy8qIGNncm91cCB2MSAqLworCisvKiBjZ3JvdXAg
djIgKi8KKyNkZWZpbmUgUEFUSF9UTVBfQ0dST1VQMgkiL3RtcC9jZ3JvdXAyIgkvKiBjZ3JvdXAg
djIgaGFzIG9ubHkgc2luZ2xlIGhpZXJhcmNoeSAqLworI2RlZmluZSBQQVRIX1RNUF9DRzJfTFRQ
CVBBVEhfVE1QX0NHUk9VUDIgIi9sdHAiCisjZGVmaW5lIFBBVEhfTUVNT1JZX01BWAkJUEFUSF9U
TVBfQ0cyX0xUUCAiL21lbW9yeS5tYXgiCisjZGVmaW5lIFBBVEhfTUVNT1JZX1NXX01BWAlQQVRI
X1RNUF9DRzJfTFRQICIvbWVtb3J5LnN3YXAubWF4IgorCit2b2lkIHRzdF9tb3VudF9jZ3JvdXAy
KGNvbnN0IGNoYXIgKm1udF9wYXRoLCBjb25zdCBjaGFyICpuZXdfcGF0aCk7Cit2b2lkIHRzdF91
bW91bnRfY2dyb3VwMihjb25zdCBjaGFyICptbnRfcGF0aCwgY29uc3QgY2hhciAqbmV3X3BhdGgp
OworCit2b2lkIHRzdF9tb3VudF9tZW1jZzIodm9pZCk7Cit2b2lkIHRzdF91bW91bnRfbWVtY2cy
KHZvaWQpOwordm9pZCB0c3Rfd3JpdGVfbWVtY2cyKGxvbmcgbWVtc3opOworCit2b2lkIHRzdF9t
b3VudF9jcHVzZXRjZzIodm9pZCk7CisvKiBjZ3JvdXAgdjIgKi8KKworc3RhdGljIGlubGluZSB2
b2lkIHRzdF9tb3VudF9tZW1jZyh2b2lkKQoreworCXRzdF9jZ192ZXIgPSB0c3RfY2dyb3VwX3Zl
cnNpb24oKTsKKworCWlmICh0c3RfY2dfdmVyICYgVFNUX0NHUk9VUF9WMSkKKwkJdHN0X21vdW50
X21lbWNnMSgpOworCisJaWYgKHRzdF9jZ192ZXIgJiBUU1RfQ0dST1VQX1YyKQorCQl0c3RfbW91
bnRfbWVtY2cyKCk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCB0c3RfdW1vdW50X21lbWNnKHZv
aWQpCit7CisJaWYgKHRzdF9jZ192ZXIgJiBUU1RfQ0dST1VQX1YxKQorCQl0c3RfdW1vdW50X21l
bWNnMSgpOworCisJaWYgKHRzdF9jZ192ZXIgJiBUU1RfQ0dST1VQX1YyKQorCQl0c3RfdW1vdW50
X21lbWNnMigpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgdHN0X3dyaXRlX21lbWNnKGxvbmcg
bWVtc3opCit7CisJaWYgKHRzdF9jZ192ZXIgJiBUU1RfQ0dST1VQX1YxKQorCQl0c3Rfd3JpdGVf
bWVtY2cxKG1lbXN6KTsKKworCWlmICh0c3RfY2dfdmVyICYgVFNUX0NHUk9VUF9WMikKKwkJdHN0
X3dyaXRlX21lbWNnMihtZW1zeik7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCB0c3RfbW91bnRf
Y3B1c2V0Y2codm9pZCkKK3sKKwl0c3RfY2dfdmVyID0gdHN0X2Nncm91cF92ZXJzaW9uKCk7CisK
KwlpZiAodHN0X2NnX3ZlciAmIFRTVF9DR1JPVVBfVjEpCisJCXRzdF9tb3VudF9jcHVzZXRjZzEo
KTsKKworCWlmICh0c3RfY2dfdmVyICYgVFNUX0NHUk9VUF9WMikKKwkJdHN0X21vdW50X2NwdXNl
dGNnMigpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgdHN0X3Vtb3VudF9jcHVzZXRjZyh2b2lk
KQoreworCWlmICh0c3RfY2dfdmVyICYgVFNUX0NHUk9VUF9WMSkKKwkJdHN0X3Vtb3VudF9jcHVz
ZXRjZzEoKTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIHRzdF93cml0ZV9jcHVzZXRjZyh2b2lk
KQoreworCWlmICh0c3RfY2dfdmVyICYgVFNUX0NHUk9VUF9WMSkKKwkJdHN0X3dyaXRlX2NwdXNl
dGNnMSgpOworfQorI2VuZGlmIC8qIFRTVF9DR1JPVVBfSCAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS90c3RfdGVzdC5oIGIvaW5jbHVkZS90c3RfdGVzdC5oCmluZGV4IDViZWRiNGY2Zi4uYjg0Zjdi
OWRkIDEwMDY0NAotLS0gYS9pbmNsdWRlL3RzdF90ZXN0LmgKKysrIGIvaW5jbHVkZS90c3RfdGVz
dC5oCkBAIC0zOSw2ICszOSw3IEBACiAjaW5jbHVkZSAidHN0X2NhcGFiaWxpdHkuaCIKICNpbmNs
dWRlICJ0c3RfaHVnZXBhZ2UuaCIKICNpbmNsdWRlICJ0c3RfYXNzZXJ0LmgiCisjaW5jbHVkZSAi
dHN0X2Nncm91cC5oIgogCiAvKgogICogUmVwb3J0cyB0ZXN0Y2FzZSByZXN1bHQuCmRpZmYgLS1n
aXQgYS9saWIvdHN0X2Nncm91cC5jIGIvbGliL3RzdF9jZ3JvdXAuYwpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAuLjg4Mzc0MDEyZgotLS0gL2Rldi9udWxsCisrKyBiL2xpYi90
c3RfY2dyb3VwLmMKQEAgLTAsMCArMSwyMzIgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGVyCisvKgorICogQ29weXJpZ2h0IChjKSAyMDIwIFJlZCBIYXQsIElu
Yy4KKyAqLworCisjZGVmaW5lIFRTVF9OT19ERUZBVUxUX01BSU4KKworI2luY2x1ZGUgPHN0ZGlv
Lmg+CisjaW5jbHVkZSA8c3lzL21vdW50Lmg+CisKKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorI2lu
Y2x1ZGUgInRzdF9zYWZlX21hY3Jvcy5oIgorI2luY2x1ZGUgInRzdF9zYWZlX3N0ZGlvLmgiCisj
aW5jbHVkZSAidHN0X2Nncm91cC5oIgorI2luY2x1ZGUgInRzdF9kZXZpY2UuaCIKKworc3RhdGlj
IGludCB0c3RfY2dyb3VwX2NoZWNrKGNvbnN0IGNoYXIgKmNncm91cCkKK3sKKwljaGFyIGxpbmVb
UEFUSF9NQVhdOworCUZJTEUgKmZpbGU7CisJaW50IGNnX2NoZWNrID0gMDsKKworCWZpbGUgPSBT
QUZFX0ZPUEVOKCIvcHJvYy9maWxlc3lzdGVtcyIsICJyIik7CisJd2hpbGUgKGZnZXRzKGxpbmUs
IHNpemVvZihsaW5lKSwgZmlsZSkpIHsKKwkJaWYgKHN0cnN0cihsaW5lLCBjZ3JvdXApICE9IE5V
TEwpIHsKKwkJCWNnX2NoZWNrID0gMTsKKwkJCWJyZWFrOworCQl9CisJfQorCVNBRkVfRkNMT1NF
KGZpbGUpOworCisJcmV0dXJuIGNnX2NoZWNrOworfQorCitlbnVtIHRzdF9jZ3JvdXBfdmVyIHRz
dF9jZ3JvdXBfdmVyc2lvbih2b2lkKQoreworCWlmICh0c3RfY2dyb3VwX2NoZWNrKCJjZ3JvdXAy
IikpIHsKKwkJaWYgKCF0c3RfaXNfbW91bnRlZCgiY2dyb3VwMiIpICYmIHRzdF9pc19tb3VudGVk
KCJjZ3JvdXAiKSkKKwkJCXJldHVybiBUU1RfQ0dST1VQX1YxOworCQllbHNlCisJCQlyZXR1cm4g
VFNUX0NHUk9VUF9WMjsKKwl9CisKKwlpZiAodHN0X2Nncm91cF9jaGVjaygiY2dyb3VwIikpCisJ
CXJldHVybiBUU1RfQ0dST1VQX1YxOworCisJdHN0X2JyayhUQ09ORiwgIkNncm91cCBpcyBub3Qg
Y29uZmlndXJlZCIpOworfQorCisvKiBjZ3JvdXAgdjEgKi8KK3ZvaWQgdHN0X21vdW50X2Nncm91
cDEoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqb3B0aW9uLAorCQkJY29uc3QgY2hhciAq
bW50X3BhdGgsIGNvbnN0IGNoYXIgKm5ld19wYXRoKQoreworCWlmICh0c3RfaXNfbW91bnRlZCht
bnRfcGF0aCkpCisJCWdvdG8gb3V0OworCisJU0FGRV9NS0RJUihtbnRfcGF0aCwgMDc3Nyk7CisJ
aWYgKG1vdW50KG5hbWUsIG1udF9wYXRoLCAiY2dyb3VwIiwgMCwgb3B0aW9uKSA9PSAtMSkgewor
CQlpZiAoZXJybm8gPT0gRU5PREVWKSB7CisJCQlpZiAocm1kaXIobW50X3BhdGgpID09IC0xKQor
CQkJCXRzdF9yZXMoVFdBUk4gfCBURVJSTk8sICJybWRpciAlcyBmYWlsZWQiLCBtbnRfcGF0aCk7
CisJCQl0c3RfYnJrKFRDT05GLAorCQkJCSAiQ2dyb3VwIHYxIGlzIG5vdCBjb25maWd1cmVkIGlu
IGtlcm5lbCIpOworCQl9CisJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sICJtb3VudCAlcyIsIG1u
dF9wYXRoKTsKKwl9CisKK291dDoKKwlTQUZFX01LRElSKG5ld19wYXRoLCAwNzc3KTsKKworCXRz
dF9yZXMoVElORk8sICJDZ3JvdXAoJXMpIHYxIG1vdW50IGF0ICVzIHN1Y2Nlc3MiLCBvcHRpb24s
IG1udF9wYXRoKTsKK30KKwordm9pZCB0c3RfdW1vdW50X2Nncm91cDEoY29uc3QgY2hhciAqbW50
X3BhdGgsIGNvbnN0IGNoYXIgKm5ld19wYXRoKQoreworCUZJTEUgKmZwOworCWludCBmZDsKKwlj
aGFyIHNfbmV3W0JVRlNJWl0sIHNbQlVGU0laXSwgdmFsdWVbQlVGU0laXTsKKworCWlmICghdHN0
X2lzX21vdW50ZWQobW50X3BhdGgpKQorCQlyZXR1cm47CisKKwkvKiBNb3ZlIGFsbCBwcm9jZXNz
ZXMgaW4gdGFzayB0byBpdHMgcGFyZW50IG5vZGUuICovCisJc3ByaW50ZihzLCAiJXMvdGFza3Mi
LCBtbnRfcGF0aCk7CisJZmQgPSBvcGVuKHMsIE9fV1JPTkxZKTsKKwlpZiAoZmQgPT0gLTEpCisJ
CXRzdF9yZXMoVFdBUk4gfCBURVJSTk8sICJvcGVuICVzIiwgcyk7CisKKwlzbnByaW50ZihzX25l
dywgQlVGU0laLCAiJXMvdGFza3MiLCBuZXdfcGF0aCk7CisJZnAgPSBmb3BlbihzX25ldywgInIi
KTsKKwlpZiAoZnAgPT0gTlVMTCkKKwkJdHN0X3JlcyhUV0FSTiB8IFRFUlJOTywgImZvcGVuICVz
Iiwgc19uZXcpOworCWlmICgoZmQgIT0gLTEpICYmIChmcCAhPSBOVUxMKSkgeworCQl3aGlsZSAo
ZmdldHModmFsdWUsIEJVRlNJWiwgZnApICE9IE5VTEwpCisJCQlpZiAod3JpdGUoZmQsIHZhbHVl
LCBzdHJsZW4odmFsdWUpIC0gMSkKKwkJCSAgICAhPSAoc3NpemVfdClzdHJsZW4odmFsdWUpIC0g
MSkKKwkJCQl0c3RfcmVzKFRXQVJOIHwgVEVSUk5PLCAid3JpdGUgJXMiLCBzKTsKKwl9CisJaWYg
KGZkICE9IC0xKQorCQljbG9zZShmZCk7CisJaWYgKGZwICE9IE5VTEwpCisJCWZjbG9zZShmcCk7
CisJaWYgKHJtZGlyKG5ld19wYXRoKSA9PSAtMSkKKwkJdHN0X3JlcyhUV0FSTiB8IFRFUlJOTywg
InJtZGlyICVzIiwgbmV3X3BhdGgpOworCWlmICh1bW91bnQobW50X3BhdGgpID09IC0xKQorCQl0
c3RfcmVzKFRXQVJOIHwgVEVSUk5PLCAidW1vdW50ICVzIiwgbW50X3BhdGgpOworCWlmIChybWRp
cihtbnRfcGF0aCkgPT0gLTEpCisJCXRzdF9yZXMoVFdBUk4gfCBURVJSTk8sICJybWRpciAlcyIs
IG1udF9wYXRoKTsKKworCXRzdF9yZXMoVElORk8sICJDZ3JvdXAgdjEgdW5tb3VudCBzdWNjZXNz
Iik7Cit9CisKK3ZvaWQgdHN0X21vdW50X21lbWNnMSh2b2lkKQoreworCXRzdF9tb3VudF9jZ3Jv
dXAxKCJtZW1jZyIsICJtZW1vcnkiLCBQQVRIX1RNUF9DRzFfTUVNLCBQQVRIX0NHMV9NRU1fTFRQ
KTsKK30KKwordm9pZCB0c3RfdW1vdW50X21lbWNnMSh2b2lkKQoreworCXRzdF91bW91bnRfY2dy
b3VwMShQQVRIX1RNUF9DRzFfTUVNLCBQQVRIX0NHMV9NRU1fTFRQKTsKK30KKwordm9pZCB0c3Rf
d3JpdGVfbWVtY2cxKGxvbmcgbWVtc3opCit7CisJU0FGRV9GSUxFX1BSSU5URihQQVRIX0NHMV9N
RU1fTFRQICIvbWVtb3J5LmxpbWl0X2luX2J5dGVzIiwgIiVsZCIsIG1lbXN6KTsKKworCVNBRkVf
RklMRV9QUklOVEYoUEFUSF9DRzFfTUVNX0xUUCAiL3Rhc2tzIiwgIiVkIiwgZ2V0cGlkKCkpOwor
fQorCit2b2lkIHRzdF9tb3VudF9jcHVzZXRjZzEodm9pZCkKK3sKKwl0c3RfbW91bnRfY2dyb3Vw
MSgiY3B1c2V0Y2ciLCAiY3B1c2V0IiwgUEFUSF9UTVBfQ0cxX0NTVCwgUEFUSF9DRzFfQ1NUX0xU
UCk7Cit9CisKK3ZvaWQgdHN0X3Vtb3VudF9jcHVzZXRjZzEodm9pZCkKK3sKKwl0c3RfdW1vdW50
X2Nncm91cDEoUEFUSF9UTVBfQ0cxX0NTVCwgUEFUSF9DRzFfQ1NUX0xUUCk7Cit9CisKK3ZvaWQg
dHN0X3dyaXRlX2NwdXNldGNnMSh2b2lkKQoreworCVNBRkVfRklMRV9QUklOVEYoUEFUSF9DRzFf
Q1NUX0xUUCAiL3Rhc2tzIiwgIiVkIiwgZ2V0cGlkKCkpOworfQorLyogY2dyb3VwIHYxICovCisK
Ky8qIGNncm91cCB2MiAqLwordm9pZCB0c3RfbW91bnRfY2dyb3VwMihjb25zdCBjaGFyICptbnRf
cGF0aCwgY29uc3QgY2hhciAqbmV3X3BhdGgpCit7CisJaWYgKHRzdF9pc19tb3VudGVkKG1udF9w
YXRoKSkKKwkJZ290byBvdXQ7CisKKwlTQUZFX01LRElSKG1udF9wYXRoLCAwNzc3KTsKKwlpZiAo
bW91bnQoImNncm91cDIiLCBtbnRfcGF0aCwgImNncm91cDIiLCAwLCBOVUxMKSA9PSAtMSkgewor
CQlpZiAoZXJybm8gPT0gRU5PREVWKSB7CisJCQlpZiAocm1kaXIobW50X3BhdGgpID09IC0xKQor
CQkJCXRzdF9yZXMoVFdBUk4gfCBURVJSTk8sICJybWRpciAlcyBmYWlsZWQiLAorCQkJCQkgbW50
X3BhdGgpOworCQkJdHN0X2JyayhUQ09ORiwKKwkJCQkgIkNncm91cCB2MiBpcyBub3QgY29uZmln
dXJlZCBpbiBrZXJuZWwiKTsKKwkJfQorCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAibW91bnQg
JXMiLCBtbnRfcGF0aCk7CisJfQorCitvdXQ6CisJU0FGRV9NS0RJUihuZXdfcGF0aCwgMDc3Nyk7
CisKKwl0c3RfcmVzKFRJTkZPLCAiQ2dyb3VwIHYyIG1vdW50IGF0ICVzIHN1Y2Nlc3MiLCBtbnRf
cGF0aCk7Cit9CisKK3ZvaWQgdHN0X3Vtb3VudF9jZ3JvdXAyKGNvbnN0IGNoYXIgKm1udF9wYXRo
LCBjb25zdCBjaGFyICpuZXdfcGF0aCkKK3sKKwlGSUxFICpmcDsKKwlpbnQgZmQ7CisJY2hhciBz
X25ld1tCVUZTSVpdLCBzW0JVRlNJWl0sIHZhbHVlW0JVRlNJWl07CisKKwlpZiAoIXRzdF9pc19t
b3VudGVkKG1udF9wYXRoKSkKKwkJcmV0dXJuOworCisJLyogTW92ZSBhbGwgcHJvY2Vzc2VzIGlu
IGNncm91cC5wcm9jcyB0byBpdHMgcGFyZW50IG5vZGUuICovCisJc3ByaW50ZihzLCAiJXMvY2dy
b3VwLnByb2NzIiwgbW50X3BhdGgpOworCWZkID0gb3BlbihzLCBPX1dST05MWSk7CisJaWYgKGZk
ID09IC0xKQorCQl0c3RfcmVzKFRXQVJOIHwgVEVSUk5PLCAib3BlbiAlcyIsIHMpOworCisJc25w
cmludGYoc19uZXcsIEJVRlNJWiwgIiVzL2Nncm91cC5wcm9jcyIsIG5ld19wYXRoKTsKKwlmcCA9
IGZvcGVuKHNfbmV3LCAiciIpOworCWlmIChmcCA9PSBOVUxMKQorCQl0c3RfcmVzKFRXQVJOIHwg
VEVSUk5PLCAiZm9wZW4gJXMiLCBzX25ldyk7CisJaWYgKChmZCAhPSAtMSkgJiYgKGZwICE9IE5V
TEwpKSB7CisJCXdoaWxlIChmZ2V0cyh2YWx1ZSwgQlVGU0laLCBmcCkgIT0gTlVMTCkKKwkJCWlm
ICh3cml0ZShmZCwgdmFsdWUsIHN0cmxlbih2YWx1ZSkgLSAxKQorCQkJICAgICE9IChzc2l6ZV90
KXN0cmxlbih2YWx1ZSkgLSAxKQorCQkJCXRzdF9yZXMoVFdBUk4gfCBURVJSTk8sICJ3cml0ZSAl
cyIsIHMpOworCX0KKwlpZiAoZmQgIT0gLTEpCisJCWNsb3NlKGZkKTsKKwlpZiAoZnAgIT0gTlVM
TCkKKwkJZmNsb3NlKGZwKTsKKwlpZiAocm1kaXIobmV3X3BhdGgpID09IC0xKQorCQl0c3RfcmVz
KFRXQVJOIHwgVEVSUk5PLCAicm1kaXIgJXMiLCBuZXdfcGF0aCk7CisJaWYgKHVtb3VudChtbnRf
cGF0aCkgPT0gLTEpCisJCXRzdF9yZXMoVFdBUk4gfCBURVJSTk8sICJ1bW91bnQgJXMiLCBtbnRf
cGF0aCk7CisJaWYgKHJtZGlyKG1udF9wYXRoKSA9PSAtMSkKKwkJdHN0X3JlcyhUV0FSTiB8IFRF
UlJOTywgInJtZGlyICVzIiwgbW50X3BhdGgpOworCisJdHN0X3JlcyhUSU5GTywgIkNncm91cCB2
MiB1bm1vdW50IHN1Y2Nlc3MiKTsKK30KKwordm9pZCB0c3RfbW91bnRfbWVtY2cyKHZvaWQpCit7
CisJdHN0X21vdW50X2Nncm91cDIoUEFUSF9UTVBfQ0dST1VQMiwgUEFUSF9UTVBfQ0cyX0xUUCk7
CisKKwlTQUZFX0ZJTEVfUFJJTlRGKFBBVEhfVE1QX0NHUk9VUDIgIi9jZ3JvdXAuc3VidHJlZV9j
b250cm9sIiwgIiVzIiwgIittZW1vcnkiKTsKK30KKwordm9pZCB0c3RfdW1vdW50X21lbWNnMigp
Cit7CisJdHN0X3Vtb3VudF9jZ3JvdXAyKFBBVEhfVE1QX0NHUk9VUDIsIFBBVEhfVE1QX0NHMl9M
VFApOworfQorCit2b2lkIHRzdF93cml0ZV9tZW1jZzIobG9uZyBtZW1zeikKK3sKKwlTQUZFX0ZJ
TEVfUFJJTlRGKFBBVEhfVE1QX0NHMl9MVFAgIi9tZW1vcnkubWF4IiwgIiVsZCIsIG1lbXN6KTsK
KworCVNBRkVfRklMRV9QUklOVEYoUEFUSF9UTVBfQ0cyX0xUUCAiL2Nncm91cC5wcm9jcyIsICIl
ZCIsIGdldHBpZCgpKTsKK30KKwordm9pZCB0c3RfbW91bnRfY3B1c2V0Y2cyKHZvaWQpCit7CisJ
dHN0X2JyayhUQ09ORiwgIkNncm91cCB2MiBoYXNuJ3QgYWNoaWV2ZSBjcHVzZXQgc3Vic3lzdGVt
Iik7Cit9CisvKiBjZ3JvdXAgdjIgKi8KLS0gCjIuMjEuMQoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

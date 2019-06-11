Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B171C3C562
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 09:48:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8EF633EB072
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 09:48:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 389013EAEBE
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:48:50 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 20544600A91
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:48:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0E47B882F5;
 Tue, 11 Jun 2019 07:48:48 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 059701972C;
 Tue, 11 Jun 2019 07:48:41 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: liwang@redhat.com
Date: Tue, 11 Jun 2019 15:47:39 +0800
Message-Id: <20190611074741.31903-2-xzhou@redhat.com>
In-Reply-To: <20190611074741.31903-1-xzhou@redhat.com>
References: <CAEemH2e5b4q+bOeE3v8FG-piSUteCinPMVmxpnkVcYCmrUc4Uw@mail.gmail.com>
 <20190611074741.31903-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 11 Jun 2019 07:48:48 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Subject: [LTP] [PATCH v7 2/4] swapon/libswapon: add helper is_swap_supported
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

VG8gY2hlY2sgaWYgdGhlIGZpbGVzeXN0ZW0gd2UgYXJlIHRlc3Rpbmcgb24gc3VwcG9ydHMgRklC
TUFQLCBta3N3YXAsCnN3YXBvbiBhbmQgc3dhcG9mZiBvcGVyYXRpb25zLiBTdXJ2aXZvciBvZiB0
aGlzIGZ1bmN0aW9uIHNob3VsZCBzdXBwb3J0CnN3YXBmaWxlIGZ1bmN0aW9uIHdlbGwsIGxpa2Ug
c3dhcG9uIGFuZCBzd2Fwb2ZmLgpNb2RpZnkgbWFrZV9zd2FwZmlsZSBmdW5jdGlvbiB0byB0ZXN0
IG1rc3dhcCBzdXBwb3J0IHN0YXR1cyBzYWZlbHkuCgpSZXZpZXdlZC1ieTogTGkgV2FuZyA8bGl3
YW5nQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQu
Y29tPgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5jIHwg
NDUgKysrKysrKysrKysrKysrKysrKy0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9u
L2xpYnN3YXBvbi5oIHwgIDcgKystCiAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9z
d2Fwb24vbGlic3dhcG9uLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9saWJz
d2Fwb24uYwppbmRleCBjZjZhOTg4OTEuLjBhNDUwMWJkZCAxMDA2NDQKLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmMKQEAgLTE5LDEzICsxOSwxNSBAQAogICoKICAq
LwogCisjaW5jbHVkZSA8ZXJybm8uaD4KKyNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCiAjaW5j
bHVkZSAidGVzdC5oIgogI2luY2x1ZGUgImxpYnN3YXBvbi5oIgogCiAvKgogICogTWFrZSBhIHN3
YXAgZmlsZQogICovCi12b2lkIG1ha2Vfc3dhcGZpbGUodm9pZCAoY2xlYW51cCkodm9pZCksIGNv
bnN0IGNoYXIgKnN3YXBmaWxlKQoraW50IG1ha2Vfc3dhcGZpbGUodm9pZCAoY2xlYW51cCkodm9p
ZCksIGNvbnN0IGNoYXIgKnN3YXBmaWxlLCBpbnQgc2FmZSkKIHsKIAlpZiAoIXRzdF9mc19oYXNf
ZnJlZShOVUxMLCAiLiIsIHN5c2NvbmYoX1NDX1BBR0VTSVpFKSAqIDEwLAogCSAgICBUU1RfQllU
RVMpKSB7CkBAIC00NSw1ICs0Nyw0NCBAQCB2b2lkIG1ha2Vfc3dhcGZpbGUodm9pZCAoY2xlYW51
cCkodm9pZCksIGNvbnN0IGNoYXIgKnN3YXBmaWxlKQogCWFyZ3ZbMV0gPSBzd2FwZmlsZTsKIAlh
cmd2WzJdID0gTlVMTDsKIAotCXRzdF9ydW5fY21kKGNsZWFudXAsIGFyZ3YsICIvZGV2L251bGwi
LCAiL2Rldi9udWxsIiwgMCk7CisJcmV0dXJuIHRzdF9ydW5fY21kKGNsZWFudXAsIGFyZ3YsICIv
ZGV2L251bGwiLCAiL2Rldi9udWxsIiwgc2FmZSk7Cit9CisKKy8qCisgKiBDaGVjayBzd2Fwb24v
c3dhcG9mZiBzdXBwb3J0IHN0YXR1cyBvZiBmaWxlc3lzdGVtcyBvciBmaWxlcworICogd2UgYXJl
IHRlc3Rpbmcgb24uCisgKi8KK3ZvaWQgaXNfc3dhcF9zdXBwb3J0ZWQodm9pZCAoY2xlYW51cCko
dm9pZCksIGNvbnN0IGNoYXIgKmZpbGVuYW1lKQoreworCWludCBmaWJtYXAgPSB0c3RfZmlibWFw
KGZpbGVuYW1lKTsKKwlsb25nIGZzX3R5cGUgPSB0c3RfZnNfdHlwZShjbGVhbnVwLCBmaWxlbmFt
ZSk7CisJY29uc3QgY2hhciAqZnN0eXBlID0gdHN0X2ZzX3R5cGVfbmFtZShmc190eXBlKTsKKwor
CWludCByZXQgPSBtYWtlX3N3YXBmaWxlKE5VTEwsIGZpbGVuYW1lLCAxKTsKKwlpZiAocmV0ICE9
IDApIHsKKwkJaWYgKGZpYm1hcCA9PSAxKSB7CisJCQl0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwK
KwkJCQkibWtzd2FwIG9uICVzIG5vdCBzdXBwb3J0ZWQiLCBmc3R5cGUpOworCQl9IGVsc2Ugewor
CQkJdHN0X2Jya20oVEZBSUwsIGNsZWFudXAsCisJCQkJIm1rc3dhcCBvbiAlcyBmYWlsZWQiLCBm
c3R5cGUpOworCQl9CisJfQorCisJVEVTVChsdHBfc3lzY2FsbChfX05SX3N3YXBvbiwgZmlsZW5h
bWUsIDApKTsKKwlpZiAoVEVTVF9SRVRVUk4gPT0gLTEpIHsKKwkJaWYgKGZpYm1hcCA9PSAxICYm
IGVycm5vID09IEVJTlZBTCkgeworCQkJdHN0X2Jya20oVENPTkYsIGNsZWFudXAsCisJCQkJIlN3
YXBmaWxlIG9uICVzIG5vdCBpbXBsZW1lbnRlZCIsIGZzdHlwZSk7CisJCX0gZWxzZSB7CisJCQl0
c3RfYnJrbShURkFJTCB8IFRFUlJOTywgY2xlYW51cCwKKwkJCQkgInN3YXBvbiBvbiAlcyBmYWls
ZWQiLCBmc3R5cGUpOworCQl9CisJfQorCisJVEVTVChsdHBfc3lzY2FsbChfX05SX3N3YXBvZmYs
IGZpbGVuYW1lLCAwKSk7CisJaWYgKFRFU1RfUkVUVVJOID09IC0xKSB7CisJCXRzdF9icmttKFRG
QUlMIHwgVEVSUk5PLCBjbGVhbnVwLAorCQkJInN3YXBvZmYgb24gJXMgZmFpbGVkIiwgZnN0eXBl
KTsKKwl9CiB9CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9s
aWJzd2Fwb24uaCBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5o
CmluZGV4IDdmNzIxMWViNC4uYTUxODMzZWMxIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uaAorKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL3N3YXBvbi9saWJzd2Fwb24uaApAQCAtMjksNiArMjksMTEgQEAKIC8qCiAgKiBNYWtlIGEg
c3dhcCBmaWxlCiAgKi8KLXZvaWQgbWFrZV9zd2FwZmlsZSh2b2lkIChjbGVhbnVwKSh2b2lkKSwg
Y29uc3QgY2hhciAqc3dhcGZpbGUpOworaW50IG1ha2Vfc3dhcGZpbGUodm9pZCAoY2xlYW51cCko
dm9pZCksIGNvbnN0IGNoYXIgKnN3YXBmaWxlLCBpbnQgc2FmZSk7CiAKKy8qCisgKiBDaGVjayBz
d2Fwb24vc3dhcG9mZiBzdXBwb3J0IHN0YXR1cyBvZiBmaWxlc3lzdGVtcyBvciBmaWxlcworICog
d2UgYXJlIHRlc3Rpbmcgb24uCisgKi8KK3ZvaWQgaXNfc3dhcF9zdXBwb3J0ZWQodm9pZCAoY2xl
YW51cCkodm9pZCksIGNvbnN0IGNoYXIgKmZpbGVuYW1lKTsKICNlbmRpZiAvKiBfX0xJQlNXQVBP
Tl9IX18gKi8KLS0gCjIuMjEuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK

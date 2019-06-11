Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BBC3C566
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 09:48:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEC883EB0DE
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 09:48:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C6B8B3EAEC1
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:48:55 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2B1F31A01142
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:48:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5207C04B2F6;
 Tue, 11 Jun 2019 07:48:53 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E16E60BCD;
 Tue, 11 Jun 2019 07:48:50 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: liwang@redhat.com
Date: Tue, 11 Jun 2019 15:47:40 +0800
Message-Id: <20190611074741.31903-3-xzhou@redhat.com>
In-Reply-To: <20190611074741.31903-1-xzhou@redhat.com>
References: <CAEemH2e5b4q+bOeE3v8FG-piSUteCinPMVmxpnkVcYCmrUc4Uw@mail.gmail.com>
 <20190611074741.31903-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 11 Jun 2019 07:48:53 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Subject: [LTP] [PATCH v7 3/4] syscalls/swapon/swapon0{1..3}: use helpers to
	check support status
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

T2Ygc3dhcCBvcGVyYXRpb25zLgoKUmV2aWV3ZWQtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KLS0tCiB0
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMS5jIHwgMTEgKystLS0tLS0t
LS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAyLmMgfCAxMyArKyst
LS0tLS0tLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMy5jIHwg
MTUgKysrKy0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMzAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fw
b24vc3dhcG9uMDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAx
LmMKaW5kZXggMzI1MzhmODJiLi5mOTVjZTBhYjIgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAxLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9zd2Fwb24vc3dhcG9uMDEuYwpAQCAtODQsMTYgKzg0LDkgQEAgc3RhdGljIHZvaWQgc2V0
dXAodm9pZCkKIAogCXRzdF90bXBkaXIoKTsKIAotCXN3aXRjaCAoKGZzX3R5cGUgPSB0c3RfZnNf
dHlwZShjbGVhbnVwLCAiLiIpKSkgewotCWNhc2UgVFNUX05GU19NQUdJQzoKLQljYXNlIFRTVF9U
TVBGU19NQUdJQzoKLQkJdHN0X2Jya20oVENPTkYsIGNsZWFudXAsCi0JCQkgIkNhbm5vdCBkbyBz
d2Fwb24gb24gYSBmaWxlIG9uICVzIGZpbGVzeXN0ZW0iLAotCQkJIHRzdF9mc190eXBlX25hbWUo
ZnNfdHlwZSkpOwotCWJyZWFrOwotCX0KKwlpc19zd2FwX3N1cHBvcnRlZChjbGVhbnVwLCAiLi90
c3Rzd2FwIik7CiAKLQltYWtlX3N3YXBmaWxlKGNsZWFudXAsICJzd2FwZmlsZTAxIik7CisJbWFr
ZV9zd2FwZmlsZShjbGVhbnVwLCAic3dhcGZpbGUwMSIsIDApOwogfQogCiBzdGF0aWMgdm9pZCBj
bGVhbnVwKHZvaWQpCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBv
bi9zd2Fwb24wMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIu
YwppbmRleCA0YWY1MTA1YzYuLjNkNDlkMGM2YiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL3N3YXBvbi9zd2Fwb24wMi5jCkBAIC0xMzIsMTggKzEzMiwxMSBAQCBzdGF0aWMgdm9pZCBz
ZXR1cCh2b2lkKQogCiAJdHN0X3RtcGRpcigpOwogCi0Jc3dpdGNoICgoZnNfdHlwZSA9IHRzdF9m
c190eXBlKGNsZWFudXAsICIuIikpKSB7Ci0JY2FzZSBUU1RfTkZTX01BR0lDOgotCWNhc2UgVFNU
X1RNUEZTX01BR0lDOgotCQl0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKLQkJCSAiQ2Fubm90IGRv
IHN3YXBvbiBvbiBhIGZpbGUgb24gJXMgZmlsZXN5c3RlbSIsCi0JCQkgdHN0X2ZzX3R5cGVfbmFt
ZShmc190eXBlKSk7Ci0JYnJlYWs7Ci0JfQorCWlzX3N3YXBfc3VwcG9ydGVkKGNsZWFudXAsICIu
L3RzdHN3YXAiKTsKIAogCVNBRkVfVE9VQ0goY2xlYW51cCwgIm5vdHN3YXAiLCAwNzc3LCBOVUxM
KTsKLQltYWtlX3N3YXBmaWxlKGNsZWFudXAsICJzd2FwZmlsZTAxIik7Ci0JbWFrZV9zd2FwZmls
ZShjbGVhbnVwLCAiYWxyZWFkeXVzZWQiKTsKKwltYWtlX3N3YXBmaWxlKGNsZWFudXAsICJzd2Fw
ZmlsZTAxIiwgMCk7CisJbWFrZV9zd2FwZmlsZShjbGVhbnVwLCAiYWxyZWFkeXVzZWQiLCAwKTsK
IAogCWlmIChsdHBfc3lzY2FsbChfX05SX3N3YXBvbiwgImFscmVhZHl1c2VkIiwgMCkpIHsKIAkJ
aWYgKGZzX3R5cGUgIT0gVFNUX0JUUkZTX01BR0lDIHx8IGVycm5vICE9IEVJTlZBTCkKZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAzLmMgYi90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMy5jCmluZGV4IDk1NWFjMjQ3Yi4u
Y2VmNTcxNTBjIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9z
d2Fwb24wMy5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAz
LmMKQEAgLTE1Myw3ICsxNTMsNyBAQCBzdGF0aWMgaW50IHNldHVwX3N3YXAodm9pZCkKIAlpbnQg
aiwgZmQ7CiAJaW50IHN0YXR1czsKIAlpbnQgcmVzID0gMDsKLQljaGFyIGZpbGVuYW1lWzE1XTsK
KwljaGFyIGZpbGVuYW1lW0ZJTEVOQU1FX01BWF07CiAJY2hhciBidWZbQlVGU0laICsgMV07CiAK
IAkvKiBGaW5kIG91dCBob3cgbWFueSBzd2FwZmlsZXMgKDEgbGluZSBwZXIgZW50cnkpIGFscmVh
ZHkgZXhpc3QgKi8KQEAgLTIxMCw3ICsyMTAsNyBAQCBzdGF0aWMgaW50IHNldHVwX3N3YXAodm9p
ZCkKIAkJCX0KIAogCQkJLyogQ3JlYXRlIHRoZSBzd2FwZmlsZSAqLwotCQkJbWFrZV9zd2FwZmls
ZShjbGVhbnVwLCBmaWxlbmFtZSk7CisJCQltYWtlX3N3YXBmaWxlKGNsZWFudXAsIGZpbGVuYW1l
LCAwKTsKIAogCQkJLyogdHVybiBvbiB0aGUgc3dhcCBmaWxlICovCiAJCQlyZXMgPSBsdHBfc3lz
Y2FsbChfX05SX3N3YXBvbiwgZmlsZW5hbWUsIDApOwpAQCAtMjQ2LDcgKzI0Niw3IEBAIHN0YXRp
YyBpbnQgc2V0dXBfc3dhcCh2b2lkKQogCiAJLyogQ3JlYXRlIGFsbCBuZWVkZWQgZXh0cmEgc3dh
cGZpbGVzIGZvciB0ZXN0aW5nICovCiAJZm9yIChqID0gMDsgaiA8IHRlc3RmaWxlczsgaisrKQot
CQltYWtlX3N3YXBmaWxlKGNsZWFudXAsIHN3YXBfdGVzdGZpbGVzW2pdLmZpbGVuYW1lKTsKKwkJ
bWFrZV9zd2FwZmlsZShjbGVhbnVwLCBzd2FwX3Rlc3RmaWxlc1tqXS5maWxlbmFtZSwgMCk7CiAK
IAlyZXR1cm4gMDsKIApAQCAtMzMzLDE0ICszMzMsNyBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lk
KQogCiAJdHN0X3RtcGRpcigpOwogCi0Jc3dpdGNoICgoZnNfdHlwZSA9IHRzdF9mc190eXBlKGNs
ZWFudXAsICIuIikpKSB7Ci0JY2FzZSBUU1RfTkZTX01BR0lDOgotCWNhc2UgVFNUX1RNUEZTX01B
R0lDOgotCQl0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKLQkJCSAiQ2Fubm90IGRvIHN3YXBvbiBv
biBhIGZpbGUgb24gJXMgZmlsZXN5c3RlbSIsCi0JCQkgdHN0X2ZzX3R5cGVfbmFtZShmc190eXBl
KSk7Ci0JYnJlYWs7Ci0JfQorCWlzX3N3YXBfc3VwcG9ydGVkKGNsZWFudXAsICIuL3RzdHN3YXAi
KTsKIAogCVRFU1RfUEFVU0U7CiB9Ci0tIAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 291062FA39
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 12:24:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 017313EA620
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 12:24:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CBCAE3EA662
 for <ltp@lists.linux.it>; Thu, 30 May 2019 12:23:55 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B84552003BA
 for <ltp@lists.linux.it>; Thu, 30 May 2019 12:23:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3336730C120D;
 Thu, 30 May 2019 10:23:53 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A2807C551;
 Thu, 30 May 2019 10:23:52 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 30 May 2019 18:23:36 +0800
Message-Id: <20190530102336.10898-2-xzhou@redhat.com>
In-Reply-To: <20190530102336.10898-1-xzhou@redhat.com>
References: <20190530102336.10898-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 30 May 2019 10:23:53 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls: update tcases using dev_fs_type to use
	some_filesystems
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

Tm90IGFsbCBvZiB0aGVtLiBTb21lIHRlc3RzIG5lZWQgdG8gcnVuIHNwZWNpZmljIGZpbGVzeXN0
ZW0uCgpTaWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KLS0tCiAu
Li4va2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jICAg
fCA4ICsrKysrKy0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHhhdHRyL2dldHhhdHRy
MDQuYyAgICAgICAgICAgfCA3ICsrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIuYwppbmRleCAwN2Mw
MjA3YzIuLmRlMjAwZmViZSAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9j
b3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIuYworKysgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jCkBAIC00Nyw2ICs0
Nyw4IEBAIHN0YXRpYyBzdHJ1Y3QgdGNhc2UgewogCXsmZmRfZGVzdCwJLTEsCUVJTlZBTH0sCiB9
OwogCitzdGF0aWMgY2hhciAqc29tZV9maWxlc3lzdGVtc1tdID0geyJleHQ0IiwgInhmcyJ9Owor
CiBzdGF0aWMgdm9pZCB2ZXJpZnlfY29weV9maWxlX3JhbmdlKHVuc2lnbmVkIGludCBuKQogewog
CXN0cnVjdCB0Y2FzZSAqdGMgPSAmdGNhc2VzW25dOwpAQCAtMTExLDggKzExMywxMCBAQCBzdGF0
aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CiAJLnNldHVwID0gc2V0dXAsCiAJLmNsZWFudXAg
PSBjbGVhbnVwLAogCS5uZWVkc19yb290ID0gMSwKLQkubW91bnRfZGV2aWNlID0gMSwKKwkubW91
bnRfZGV2aWNlID0gMCwKKwkubmVlZHNfZGV2aWNlID0gMSwKKwkuZm9ybWF0X2RldmljZSA9IDEs
CiAJLm1udHBvaW50ID0gTU5UUE9JTlQsCi0JLmRldl9mc190eXBlID0gImV4dDQiLAorCS5zb21l
X2ZpbGVzeXN0ZW1zID0gc29tZV9maWxlc3lzdGVtcywKIAkudGVzdF92YXJpYW50cyA9IFRFU1Rf
VkFSSUFOVFMsCiB9OwpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXR4
YXR0ci9nZXR4YXR0cjA0LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHhhdHRyL2dl
dHhhdHRyMDQuYwppbmRleCAxZGNiMTRkYTMuLmM1YWUwM2Y0NiAxMDA2NDQKLS0tIGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9nZXR4YXR0ci9nZXR4YXR0cjA0LmMKKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9nZXR4YXR0ci9nZXR4YXR0cjA0LmMKQEAgLTU0LDYgKzU0LDcgQEAK
IHN0YXRpYyB2b2xhdGlsZSBpbnQgZW5kOwogc3RhdGljIGNoYXIgYmlnX3ZhbHVlWzUxMl07CiBz
dGF0aWMgY2hhciBzbWFsbF92YWx1ZVszMl07CitzdGF0aWMgY2hhciAqc29tZV9maWxlc3lzdGVt
c1tdID0geyJleHQ0IiwgInhmcyJ9OwogCiBzdGF0aWMgdm9pZCBzaWdwcm9jKGludCBzaWcpCiB7
CkBAIC0xMjAsOSArMTIxLDExIEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCiBzdGF0aWMgc3Ry
dWN0IHRzdF90ZXN0IHRlc3QgPSB7CiAJLm5lZWRzX3RtcGRpciA9IDEsCiAJLm5lZWRzX3Jvb3Qg
PSAxLAotCS5tb3VudF9kZXZpY2UgPSAxLAotCS5kZXZfZnNfdHlwZSA9ICJ4ZnMiLAorCS5tb3Vu
dF9kZXZpY2UgPSAwLAorCS5uZWVkc19kZXZpY2UgPSAxLAorCS5mb3JtYXRfZGV2aWNlID0gMSwK
IAkubW50cG9pbnQgPSBNTlRQT0lOVCwKKwkuc29tZV9maWxlc3lzdGVtcyA9IHNvbWVfZmlsZXN5
c3RlbXMsCiAJLmZvcmtzX2NoaWxkID0gMSwKIAkudGVzdF9hbGwgPSB2ZXJpZnlfZ2V0eGF0dHIs
CiAJLnNldHVwID0gc2V0dXAKLS0gCjIuMjEuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

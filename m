Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C3930C2B
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 11:57:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16C76390274
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 11:57:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0A7DF3EA05E
 for <ltp@lists.linux.it>; Fri, 31 May 2019 11:57:10 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 03C271A0172F
 for <ltp@lists.linux.it>; Fri, 31 May 2019 11:57:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5CD613082140;
 Fri, 31 May 2019 09:57:07 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC5675D967;
 Fri, 31 May 2019 09:57:06 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Fri, 31 May 2019 17:56:59 +0800
Message-Id: <20190531095659.22796-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 31 May 2019 09:57:07 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls: testing on all fs for copy_file_range02 and
	getxattr04
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

VG8gaW5jcmVhc2UgdGVzdCBjb3ZlcmFnZS4gSWYgdGhlIHRlc3RpbmcgZnMgaXMgbm90IHN1cHBv
cnRpbmcKdGhpcyBzeXNjYWxsLCB0Y2FzZSBoYW5kbGVzIGl0IHdlbGwuCgpTaWduZWQtb2ZmLWJ5
OiBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jIHwgMiArLQogdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9nZXR4YXR0ci9nZXR4YXR0cjA0LmMgICAgICAgICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2Nv
cHlfZmlsZV9yYW5nZTAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9y
YW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jCmluZGV4IDA3YzAyMDdjMi4uZDNmYjczN2JlIDEwMDY0
NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2Zp
bGVfcmFuZ2UwMi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3Jh
bmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMKQEAgLTExMyw2ICsxMTMsNiBAQCBzdGF0aWMgc3RydWN0
IHRzdF90ZXN0IHRlc3QgPSB7CiAJLm5lZWRzX3Jvb3QgPSAxLAogCS5tb3VudF9kZXZpY2UgPSAx
LAogCS5tbnRwb2ludCA9IE1OVFBPSU5ULAotCS5kZXZfZnNfdHlwZSA9ICJleHQ0IiwKKwkuYWxs
X2ZpbGVzeXN0ZW1zID0gMSwKIAkudGVzdF92YXJpYW50cyA9IFRFU1RfVkFSSUFOVFMsCiB9Owpk
aWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXR4YXR0ci9nZXR4YXR0cjA0
LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHhhdHRyL2dldHhhdHRyMDQuYwppbmRl
eCAxZGNiMTRkYTMuLjkwNWFiZDU4NyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9nZXR4YXR0ci9nZXR4YXR0cjA0LmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9nZXR4YXR0ci9nZXR4YXR0cjA0LmMKQEAgLTEyMSw3ICsxMjEsNyBAQCBzdGF0aWMgc3RydWN0
IHRzdF90ZXN0IHRlc3QgPSB7CiAJLm5lZWRzX3RtcGRpciA9IDEsCiAJLm5lZWRzX3Jvb3QgPSAx
LAogCS5tb3VudF9kZXZpY2UgPSAxLAotCS5kZXZfZnNfdHlwZSA9ICJ4ZnMiLAorCS5hbGxfZmls
ZXN5c3RlbXMgPSAxLAogCS5tbnRwb2ludCA9IE1OVFBPSU5ULAogCS5mb3Jrc19jaGlsZCA9IDEs
CiAJLnRlc3RfYWxsID0gdmVyaWZ5X2dldHhhdHRyLAotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

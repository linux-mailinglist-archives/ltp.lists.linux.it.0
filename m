Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8623C8D6
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 12:25:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 565B63EAFE9
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 12:25:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 6C7F83EAA06
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 12:25:33 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9984B1A0114B
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 12:25:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5B2C3092675
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 10:25:25 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 063AC60BF1;
 Tue, 11 Jun 2019 10:25:24 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 11 Jun 2019 12:25:18 +0200
Message-Id: <916c20b9a379badd37a85aa1e1339566c9807d23.1560248542.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 11 Jun 2019 10:25:25 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: liwan@redhat.com
Subject: [LTP] [PATCH v2] syscalls/ioctl_ns0[156]: align stack and wait for
	child
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGVzdCBjcmFzaGVzIChTSUdCVVMpIHdoZW4gdXNpbmcgY2hpbGQgc3RhY2sgaGF2ZSBiZWVuIG9i
c2VydmVkIGZvcgppb2N0bF9uczAxLiBBbGlnbiBzdGFjayB0byA2NCBieXRlcyBmb3IgYWxsIHRl
c3RjYXNlcyB1c2luZyBjbG9uZSwKd2hpY2ggc2hvdWxkIHdvcmsgZm9yIGFueSBhcmNoLgoKQWRk
IFNJR0NITEQgdG8gY2xvbmUgZmxhZ3MsIHNvIHRoYXQgTFRQIGxpYnJhcnkgY2FuIHJlYXAgYWxs
IGNoaWxkcmVuCmFuZCBjaGVjayB0aGVpciByZXR1cm4gY29kZS4gIEFsc28gY2hlY2sgbHRwX2Ns
b25lKCkgcmV0dXJuIHZhbHVlLgoKU3VwcHJlc3Mgd2FybmluZyBmb3IgdW51c2VkICphcmcgaW4g
Y2hpbGQoKS4KClNpZ25lZC1vZmYtYnk6IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29t
PgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwMS5jIHwgIDkg
KysrKystLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX25zMDUuYyB8
ICA4ICsrKysrLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX25zMDYu
YyB8IDExICsrKysrKystLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9j
dGwvaW9jdGxfbnMwMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9u
czAxLmMKaW5kZXggZGZkZTRkYTZjNWQ2Li5hNmZmNTdkNGNiZjkgMTAwNjQ0Ci0tLSBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwMS5jCisrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwMS5jCkBAIC0yMyw3ICsyMyw3IEBACiAKICNk
ZWZpbmUgU1RBQ0tfU0laRSAoMTAyNCAqIDEwMjQpCiAKLXN0YXRpYyBjaGFyIGNoaWxkX3N0YWNr
W1NUQUNLX1NJWkVdOworc3RhdGljIGNoYXIgY2hpbGRfc3RhY2tbU1RBQ0tfU0laRV0gX19hdHRy
aWJ1dGVfXygoYWxpZ25lZCg2NCkpKTsKIAogc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIHsKQEAg
LTUzLDcgKzUzLDcgQEAgc3RhdGljIHZvaWQgdGVzdF9uc19nZXRfcGFyZW50KHZvaWQpCiAJfQog
fQogCi1zdGF0aWMgaW50IGNoaWxkKHZvaWQgKmFyZykKK3N0YXRpYyBpbnQgY2hpbGQodm9pZCAq
YXJnIExUUF9BVFRSSUJVVEVfVU5VU0VEKQogewogCXRlc3RfbnNfZ2V0X3BhcmVudCgpOwogCXJl
dHVybiAwOwpAQCAtNjMsOCArNjMsOSBAQCBzdGF0aWMgdm9pZCBydW4odm9pZCkKIHsKIAl0ZXN0
X25zX2dldF9wYXJlbnQoKTsKIAotCWx0cF9jbG9uZShDTE9ORV9ORVdQSUQsICZjaGlsZCwgMCwK
LQkJU1RBQ0tfU0laRSwgY2hpbGRfc3RhY2spOworCWlmIChsdHBfY2xvbmUoQ0xPTkVfTkVXUElE
IHwgU0lHQ0hMRCwgJmNoaWxkLCAwLAorCQlTVEFDS19TSVpFLCBjaGlsZF9zdGFjaykgPT0gLTEp
CisJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sICJsdHBfY2xvbmUgZmFpbGVkIik7CiB9CiAKIHN0
YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwNS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9pb2N0bC9pb2N0bF9uczA1LmMKaW5kZXggYThkZWUwN2ExMTU0Li42ODVhNWY2ODNiMjUgMTAw
NjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwNS5jCisr
KyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwNS5jCkBAIC0yMiw3
ICsyMiw3IEBACiAKICNkZWZpbmUgU1RBQ0tfU0laRSAoMTAyNCAqIDEwMjQpCiAKLXN0YXRpYyBj
aGFyIGNoaWxkX3N0YWNrW1NUQUNLX1NJWkVdOworc3RhdGljIGNoYXIgY2hpbGRfc3RhY2tbU1RB
Q0tfU0laRV0gX19hdHRyaWJ1dGVfXygoYWxpZ25lZCg2NCkpKTsKIAogc3RhdGljIHZvaWQgc2V0
dXAodm9pZCkKIHsKQEAgLTMyLDcgKzMyLDcgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIAkJ
dHN0X3JlcyhUQ09ORiwgIm5hbWVzcGFjZSBub3QgYXZhaWxhYmxlIik7CiB9CiAKLXN0YXRpYyBp
bnQgY2hpbGQodm9pZCAqYXJnKQorc3RhdGljIGludCBjaGlsZCh2b2lkICphcmcgTFRQX0FUVFJJ
QlVURV9VTlVTRUQpCiB7CiAJaWYgKGdldHBpZCgpICE9IDEpCiAJCXRzdF9yZXMoVEZBSUwsICJj
aGlsZCBzaG91bGQgdGhpbmsgaXRzIHBpZCBpcyAxIik7CkBAIC00NCw4ICs0NCwxMCBAQCBzdGF0
aWMgaW50IGNoaWxkKHZvaWQgKmFyZykKIAogc3RhdGljIHZvaWQgcnVuKHZvaWQpCiB7Ci0JcGlk
X3QgcGlkID0gbHRwX2Nsb25lKENMT05FX05FV1BJRCwgJmNoaWxkLCAwLAorCXBpZF90IHBpZCA9
IGx0cF9jbG9uZShDTE9ORV9ORVdQSUQgfCBTSUdDSExELCAmY2hpbGQsIDAsCiAJCVNUQUNLX1NJ
WkUsIGNoaWxkX3N0YWNrKTsKKwlpZiAocGlkID09IC0xKQorCQl0c3RfYnJrKFRCUk9LIHwgVEVS
Uk5PLCAibHRwX2Nsb25lIGZhaWxlZCIpOwogCiAJY2hhciBjaGlsZF9uYW1lc3BhY2VbMjBdOwog
CWludCBteV9mZCwgY2hpbGRfZmQsIHBhcmVudF9mZDsKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwNi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9pb2N0bC9pb2N0bF9uczA2LmMKaW5kZXggODA1YTBhMDcyZTJmLi5iZjU4MDA0MzQ3MjMg
MTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwNi5j
CisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwNi5jCkBAIC0y
Myw3ICsyMyw3IEBACiAKICNkZWZpbmUgU1RBQ0tfU0laRSAoMTAyNCAqIDEwMjQpCiAKLXN0YXRp
YyBjaGFyIGNoaWxkX3N0YWNrW1NUQUNLX1NJWkVdOworc3RhdGljIGNoYXIgY2hpbGRfc3RhY2tb
U1RBQ0tfU0laRV0gX19hdHRyaWJ1dGVfXygoYWxpZ25lZCg2NCkpKTsKIAogc3RhdGljIHZvaWQg
c2V0dXAodm9pZCkKIHsKQEAgLTMzLDcgKzMzLDcgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkK
IAkJdHN0X3JlcyhUQ09ORiwgIm5hbWVzcGFjZSBub3QgYXZhaWxhYmxlIik7CiB9CiAKLXN0YXRp
YyBpbnQgY2hpbGQodm9pZCAqYXJnKQorc3RhdGljIGludCBjaGlsZCh2b2lkICphcmcgTFRQX0FU
VFJJQlVURV9VTlVTRUQpCiB7CiAJVFNUX0NIRUNLUE9JTlRfV0FJVCgwKTsKIAlyZXR1cm4gMDsK
QEAgLTQxLDEwICs0MSwxMyBAQCBzdGF0aWMgaW50IGNoaWxkKHZvaWQgKmFyZykKIAogc3RhdGlj
IHZvaWQgcnVuKHZvaWQpCiB7Ci0JcGlkX3QgcGlkID0gbHRwX2Nsb25lKENMT05FX05FV1VTRVIs
ICZjaGlsZCwgMCwKLQkJU1RBQ0tfU0laRSwgY2hpbGRfc3RhY2spOwogCWNoYXIgY2hpbGRfbmFt
ZXNwYWNlWzIwXTsKIAorCXBpZF90IHBpZCA9IGx0cF9jbG9uZShDTE9ORV9ORVdVU0VSIHwgU0lH
Q0hMRCwgJmNoaWxkLCAwLAorCQlTVEFDS19TSVpFLCBjaGlsZF9zdGFjayk7CisJaWYgKHBpZCA9
PSAtMSkKKwkJdHN0X2JyayhUQlJPSyB8IFRFUlJOTywgImx0cF9jbG9uZSBmYWlsZWQiKTsKKwog
CXNwcmludGYoY2hpbGRfbmFtZXNwYWNlLCAiL3Byb2MvJWkvbnMvdXNlciIsIHBpZCk7CiAJaW50
IG15X2ZkLCBjaGlsZF9mZCwgcGFyZW50X2ZkOwogCi0tIAoxLjguMy4xCgoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

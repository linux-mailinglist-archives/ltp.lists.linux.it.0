Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EFD17426
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 10:45:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C3F9F294B0E
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 10:45:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A9386294A8D
 for <ltp@lists.linux.it>; Wed,  8 May 2019 10:44:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6C9066011EF
 for <ltp@lists.linux.it>; Wed,  8 May 2019 10:44:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2333DC058CBD;
 Wed,  8 May 2019 08:44:53 +0000 (UTC)
Received: from dhcp-12-157.nay.redhat.com (dhcp-12-157.nay.redhat.com
 [10.66.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF0EE5D9D6;
 Wed,  8 May 2019 08:44:50 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed,  8 May 2019 16:44:46 +0800
Message-Id: <20190508084447.18191-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 08 May 2019 08:44:53 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] numa: fix numa test error with non-continuous
	nodes
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

TnVtYSB0ZXN0IGZhaWxlZCBvbiBzdWNoIG1hY2hpbmUgd2hpY2ggaGFzIG5vbi1jb250aW51b3Vz
IG51bWEgbm9kZXMsCml0IGdldHMgd3JvbmcgZGF0YSBiZWNhdXNlIG9mIHRoZSBiZWxvdyBzeW50
YXggcnVsZSBpcyBub3QgYXBwbGljYWJsZQp0byB0aGF0IHNwZWNpYWwgc2l0dWF0aW9uLgogIGAg
bnVtYXN0YXQgLXAgJHBpZCB8YXdrICcvXlRvdGFsLyB7cHJpbnQgJCckKChub2RlKzIpKSd9JwpJ
biB0aGlzIHBhdGNoLCB3ZSBmaXggdGhhdCB2aWEgYSBiaXQgY29tcGxleCB3YXkgb2YgYXdrIHRv
IGdldCB0aGUKYWxsb2NhdGVkIG1lbW9yeSBpbiBzcGVjaWZpZWQgbm9kZS4KCiAgIyBudW1hY3Rs
IC1ICiAgYXZhaWxhYmxlOiAyIG5vZGVzICgwLDgpCiAgbm9kZSAwIGNwdXM6IDAgMSAyIDMgNCA1
IDYgNyA4IDkgMTAgMTEgMTIgMTMgMTQgMTUgMTYgMTcgMTgKICAgICAgICAgICAgICAgMTkgMjAg
MjEgMjIgMjMgMjQgMjUgMjYgMjcgMjggMjkgMzAgMzEgMzIgMzMgMzQKICAgICAgICAgICAgICAg
MzUgMzYgMzcgMzggMzkgNDAgNDEgNDIgNDMgNDQgNDUgNDYgNDcgNDggNDkgNTAKICAgICAgICAg
ICAgICAgNTEgNTIgNTMgNTQgNTUgNTYgNTcgNTggNTkgNjAgNjEgNjIgNjMKICBub2RlIDAgc2l6
ZTogMjU3NzQxIE1CCiAgbm9kZSAwIGZyZWU6IDI1MzE1OCBNQgogIG5vZGUgOCBjcHVzOiA2NCA2
NSA2NiA2NyA2OCA2OSA3MCA3MSA3MiA3MyA3NCA3NSA3NiA3NyA3OCA3OQogICAgICAgICAgICAg
ICA4MCA4MSA4MiA4MyA4NCA4NSA4NiA4NyA4OCA4OSA5MCA5MSA5MiA5MyA5NCA5NQogICAgICAg
ICAgICAgICA5NiA5NyA5OCA5OSAxMDAgMTAxIDEwMiAxMDMgMTA0IDEwNSAxMDYgMTA3IDEwOAog
ICAgICAgICAgICAgICAxMDkgMTEwIDExMSAxMTIgMTEzIDExNCAxMTUgMTE2IDExNyAxMTggMTE5
IDEyMAogICAgICAgICAgICAgICAxMjEgMTIyIDEyMyAxMjQgMTI1IDEyNiAxMjcKICBub2RlIDgg
c2l6ZTogMjYxNzUyIE1CCiAgbm9kZSA4IGZyZWU6IDI0MDkzMyBNQgogIG5vZGUgZGlzdGFuY2Vz
OgogIG5vZGUgICAwICAgOAogICAgMDogIDEwICA0MAogICAgODogIDQwICAxMAoKICAjIG51bWFz
dGF0IC1wICRwaWQKICBQZXItbm9kZSBwcm9jZXNzIG1lbW9yeSB1c2FnZSAoaW4gTUJzKSBmb3Ig
UElEIDM0MTY4IChzdXBwb3J0X251bWEpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTm9k
ZSAwICAgICAgICAgIE5vZGUgOCAgICAgICAgICAgVG90YWwKICAgICAgICAgICAgICAgICAgICAt
LS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tLS0tLQogIEh1Z2UgICAg
ICAgICAgICAgICAgICAgICAgICAgMC4wMCAgICAgICAgICAgIDAuMDAgICAgICAgICAgICAwLjAw
CiAgSGVhcCAgICAgICAgICAgICAgICAgICAgICAgICAwLjAwICAgICAgICAgICAgMC4xMiAgICAg
ICAgICAgIDAuMTIKICBTdGFjayAgICAgICAgICAgICAgICAgICAgICAgIDAuMDAgICAgICAgICAg
ICAwLjA2ICAgICAgICAgICAgMC4wNgogIFByaXZhdGUgICAgICAgICAgICAgICAgICAgICAgMS42
MiAgICAgICAgICAgIDEuNTAgICAgICAgICAgICAzLjEyCiAgLS0tLS0tLS0tLS0tLS0tLSAgLS0t
LS0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0tLS0KICBUb3RhbCAgICAg
ICAgICAgICAgICAgICAgICAgIDEuNjIgICAgICAgICAgICAxLjY5ICAgICAgICAgICAgMy4zMQoK
U2lnbmVkLW9mZi1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+CkNjOiBDaHVueXUgSHUg
PGNodWh1QHJlZGhhdC5jb20+CkNjOiBDeXJpbCBIcnViaXMgPGNocnViaXNAc3VzZS5jej4KLS0t
CiB0ZXN0Y2FzZXMva2VybmVsL251bWEvbnVtYTAxLnNoIHwgMjYgKysrKysrKysrKysrKysrKysr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvbnVtYS9udW1hMDEuc2ggYi90ZXN0Y2Fz
ZXMva2VybmVsL251bWEvbnVtYTAxLnNoCmluZGV4IDMzMzkzYWM4ZC4uN2YzZGVlODQ5IDEwMDc1
NQotLS0gYS90ZXN0Y2FzZXMva2VybmVsL251bWEvbnVtYTAxLnNoCisrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvbnVtYS9udW1hMDEuc2gKQEAgLTUyLDkgKzUyLDE4IEBAIFRTVF9ORUVEU19DTURTPSJh
d2sgYmMgbnVtYWN0bCBudW1hc3RhdCIKIGV4dHJhY3RfbnVtYXN0YXRfcCgpCiB7CiAJbG9jYWwg
cGlkPSQxCi0JbG9jYWwgbm9kZT0kKCgkMiArIDIpKQotCi0JZWNobyAkKG51bWFzdGF0IC1wICRw
aWQgfGF3ayAnL15Ub3RhbC8ge3ByaW50ICQnJG5vZGUnfScpCisJbG9jYWwgbm9kZT0kMgorCisJ
ZWNobyAkKG51bWFzdGF0IC1wICRwaWQgfAkJXAorCQlhd2sgLXYgbm9kZT0kbm9kZSAnL05vZGUv
IHsJXAorCQlnc3ViKCJOb2RlIiwgIiIpOwkJXAorCQlmb3IgKGk9MDsgaTxORjsgaSsrKQkJXAor
CQkJaWYgKCRpID09IG5vZGUpCQlcCisJCQkJY29sPWkrMTsJXAorCQkJbmV4dAkJCVwKKwkJfQkJ
CQlcCisJCS9eVG90YWwvIHtwcmludCAkY29sfScJCVwKKwkpCiB9CiAKIGNoZWNrX2Zvcl9zdXBw
b3J0X251bWEoKQpAQCAtMzYzLDcgKzM3MiwxNiBAQCB0ZXN0OSgpCiAJCXBpZD0kIQogCQlUU1Rf
UkVUUllfRlVOQyAiY2hlY2tfZm9yX3N1cHBvcnRfbnVtYSAkcGlkIiAwCiAKLQkJTWVtX2h1Z2U9
JChlY2hvICQobnVtYXN0YXQgLXAgJHBpZCB8YXdrICcvXkh1Z2UvIHtwcmludCAkJyQoKG5vZGUr
MikpJ30nKSkKKwkJTWVtX2h1Z2U9JChlY2hvICQobnVtYXN0YXQgLXAgJHBpZCB8CVwKKwkJCWF3
ayAtdiBub2RlPSRub2RlICcvTm9kZS8gewlcCisJCQlnc3ViKCJOb2RlIiwgIiIpOwkJXAorCQkJ
Zm9yIChpPTA7IGk8TkY7IGkrKykJCVwKKwkJCQlpZiAoJGkgPT0gbm9kZSkJCVwKKwkJCQkJY29s
PWkrMTsJXAorCQkJCW5leHQJCQlcCisJCQl9CQkJCVwKKwkJCS9eSHVnZS8ge3ByaW50ICRjb2x9
JykJCVwKKwkJKQogCQlNZW1faHVnZT0kKCgke01lbV9odWdlJS4qfSAqIDEwMjQpKQogCiAJCWlm
IFsgIiRNZW1faHVnZSIgLWx0ICIkSFBBR0VfU0laRSIgXTsgdGhlbgotLSAKMi4yMC4xCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

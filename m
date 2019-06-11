Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 466133C99A
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 13:01:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BACB3EAFEF
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 13:01:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C861F3EA360
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 13:01:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D3A4A601629
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 13:00:59 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,577,1557158400"; d="scan'208";a="66915347"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jun 2019 19:00:56 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 52E2D4CD846F
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 19:00:57 +0800 (CST)
Received: from localhost.localdomain (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 11 Jun 2019 19:00:54 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 11 Jun 2019 19:00:15 +0800
Message-ID: <1560250815-2308-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 52E2D4CD846F.AE0CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] cgroup_regression_test.sh: fix test_5 possible mount
	failure because of cgroup hierarchy
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

Q3VycmVudGx5LCBpZiBzeXN0ZW1zIGRvZXNuJ3QgbW91bnQgc3Vic3lzMSxzdWJzeXMyIGFuZCB0
aGUgaGllcmFyY2h5IGlzIG5vdCBlcXVhbCB0byAwLCBydW5uaW5nIGl0CnJlcG9ydHMgdGhlIGZv
bGxvd2luZyBlcnJvcjoKCm1vdW50OiB4eHggaXMgYWxyZWFkeSBtb3VudGVkIG9yIC90bXAvbHRw
LXdQdzA4YW5tVEkvTFRQX2Nncm91cF9yZWdyZXNzaW9uX3Rlc3QuVjRqZjBxclM3ei9jZ3JvdXAg
YnVzeQpjZ3JvdXBfcmVncmVzc2lvbl90ZXN0IDUgVEZBSUw6IG1vdW50IG5ldF9wcmlvIGFuZCBw
aWRzIGZhaWxlZAoKSXQgZmFpbHMgYmVjYXVzZSBsaWJjZ3JvdXAgZG9lc24ndCBwZXJtbWl0IGRl
c3Ryb3kgY2dyb3VwIHN1YnN5c3RlbSBoaWVyYXJjaGllcy4KU2ltcGxlIHVtbm91dCBkb2VzIG5v
dCBkZXN0cm95IHRoZSBoaWVyYXJjaGllcy4gVGhleSBzdGlsbCBsaXZlIGluc2lkZSBrZXJuZWwh
CgpXaGVuICBoaWVyYXJjaHkgaXMgZXF1YWwgdG8gMCBpbiAvcHJvYy9jZ3JvdXBzLCB3ZSBjYW4g
bW91bnQgdGhlbSB0b2dldGhlciBvbgphIG5ldyBtb3VudHBvaW50LgoKSSBhZGQgYSBjaGVjayBm
b3Igc3Vic3lzdGVtIGhpZXJhcmNoeSBhbmQgZ2V0IHN1YnN5c3RlbSBmcm9tIGhlYWQuCgpOb3Rp
Y2U6Cm1vcmUgaW5mb3JtYXRpb24gYWJvdXQiQnVnIDYxMjgwNSAtIGNncm91cDogbW91bnQ6IG5v
bmUgYWxyZWFkeSBtb3VudGVkIG9yIC9jZ3JvdXBzIGJ1c3kiCgpTaWduZWQtb2ZmLWJ5OiBZYW5n
IFh1IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgotLS0KIC4uLi9jZ3JvdXAvY2dyb3Vw
X3JlZ3Jlc3Npb25fdGVzdC5zaCAgICAgICAgICAgfCAxOCArKysrKysrKysrKysrLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY2dyb3VwL2Nncm91cF9yZWdyZXNzaW9u
X3Rlc3Quc2ggYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2Nncm91cC9jZ3JvdXBfcmVn
cmVzc2lvbl90ZXN0LnNoCmluZGV4IGUxOTdmNWQzZi4uMzhjYjc2MGMyIDEwMDc1NQotLS0gYS90
ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2Nncm91cC9jZ3JvdXBfcmVncmVzc2lvbl90ZXN0
LnNoCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY2dyb3VwL2Nncm91cF9yZWdy
ZXNzaW9uX3Rlc3Quc2gKQEAgLTI1Miw4ICsyNTIsMTAgQEAgdGVzdDUoKQogCQlyZXR1cm4KIAlm
aQogCi0JbG9jYWwgc3Vic3lzMT1gdGFpbCAtbiAxIC9wcm9jL2Nncm91cHMgfCBhd2sgJ3sgcHJp
bnQgJDEgfSdgCi0JbG9jYWwgc3Vic3lzMj1gdGFpbCAtbiAyIC9wcm9jL2Nncm91cHMgfCBoZWFk
IC0xIHwgYXdrICd7IHByaW50ICQxIH0nYAorCWxvY2FsIHN1YnN5czE9YGhlYWQgLTIgL3Byb2Mv
Y2dyb3VwcyB8IHRhaWwgLW4gMSB8IGF3ayAneyBwcmludCAkMSB9J2AKKwlsb2NhbCBzdWJzeXMx
X2hpZXJhcmNoeT1gaGVhZCAtMiAvcHJvYy9jZ3JvdXBzIHwgdGFpbCAtbiAxIHwgYXdrICd7IHBy
aW50ICQyIH0nYAorCWxvY2FsIHN1YnN5czI9YGhlYWQgLTMgL3Byb2MvY2dyb3VwcyB8IHRhaWwg
LW4gMSB8IGF3ayAneyBwcmludCAkMSB9J2AKKwlsb2NhbCBzdWJzeXMyX2hpZXJhcmNoeT1gaGVh
ZCAtMyAvcHJvYy9jZ3JvdXBzIHwgdGFpbCAtbiAxIHwgYXdrICd7IHByaW50ICQyIH0nYAogCiAJ
IyBBY2NvdW50aW5nIGhlcmUgZm9yIHRoZSBmYWN0IHRoYXQgdGhlIGNob3NlbiBzdWJzeXN0ZW1z
IGNvdWxkCiAJIyBoYXZlIGJlZW4gYWxyZWFkeSBwcmV2aW91c2x5IG1vdW50ZWQgYXQgYm9vdCB0
aW1lOiBpbiBzdWNoIGEKQEAgLTI2NywxMCArMjY5LDE2IEBAIHRlc3Q1KCkKIAlpZiBbIC16ICIk
bW91bnRlZCIgXTsgdGhlbgogCQltbnRwb2ludD1jZ3JvdXAKIAkJZmFpbGluZz0kc3Vic3lzMQot
CQltb3VudCAtdCBjZ3JvdXAgLW8gJHN1YnN5czEsJHN1YnN5czIgeHh4ICRtbnRwb2ludC8KKwkJ
bW91bnQgLXQgY2dyb3VwIC1vICRzdWJzeXMxLCRzdWJzeXMyIHh4eCAkbW50cG9pbnQvIDI+L2Rl
di9udWxsCisJCSMgRXZlbiBzdWJzeXN0ZW0gaGFzIG5vdCBiZWVuIG1vdW50ZWQsIGl0IHN0aWxs
IGxpdmUgaW4ga2VybmVsLgorCQkjIFNvIHdlIHdpbGwgZ2V0IEVCVVNZIHdoZW4gYm90aCBtb3Vu
dCBzdWJzeXMxIGFuZCBzdWJzeXMyIGlmCisJCSMgaGllcmFyY2h5IGlzbid0IGVxdWFsIHRvIDAu
CiAJCWlmIFsgJD8gLW5lIDAgXTsgdGhlbgotCQkJdHN0X3JlcyBURkFJTCAibW91bnQgJHN1YnN5
czEgYW5kICRzdWJzeXMyIGZhaWxlZCIKLQkJCXJldHVybgorCQkJaWYgWyAiJHN1YnN5czFfaGll
cmFyY2h5IiA9IDAgLWEgIiRzdWJzeXMyX2hpZXJhcmNoeSIgPSAwIF07IHRoZW4KKwkJCQl0c3Rf
cmVzIFRGQUlMICJtb3VudCAkc3Vic3lzMSBhbmQgJHN1YnN5czIgZmFpbGVkIgorCQkJCXJldHVy
bgorCQkJZmkKKwkJCWZhaWxpbmc9JHN1YnN5czEsJHN1YnN5czIKIAkJZmkKIAllbHNlCiAJCSMg
VXNlIHRoZSBwcmUtZXNpc3RlbnQgbW91bnRwb2ludCBhcyAkbW50cG9pbnQgYW5kIHVzZSBhCi0t
IAoyLjE4LjEKCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK

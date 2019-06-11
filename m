Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 889C43D6D4
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 21:30:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F8853EAFFA
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 21:30:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1E8CD3EA9E9
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 21:30:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2D9D3200B2B
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 21:30:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C64EFAF79;
 Tue, 11 Jun 2019 19:30:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 11 Jun 2019 21:30:19 +0200
Message-Id: <20190611193021.17651-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611193021.17651-1-pvorel@suse.cz>
References: <20190611193021.17651-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Ignaz Forster <iforster@suse.de>
Subject: [LTP] [PATCH v3 2/4] shell: Add $TST_DEVICE as default parameter to
	tst_umount
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

KyB1c2UgaXQgZGlyZWN0bHkgYXMgYSBjbGVhbnVwIGZ1bmN0aW9uIGluIGRmMDEuc2gKCkFja2Vk
LWJ5OiBNaW1pIFpvaGFyIDx6b2hhckBsaW51eC5pYm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBQZXRy
IFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KLS0tCiBkb2MvdGVzdC13cml0aW5nLWd1aWRlbGluZXMu
dHh0ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiB0ZXN0Y2FzZXMvY29tbWFu
ZHMvZGYvZGYwMS5zaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNyArLS0tLS0tCiB0
ZXN0Y2FzZXMvY29tbWFuZHMvbWtmcy9ta2ZzMDEuc2ggICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMiArLQogdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2lt
YV9zZXR1cC5zaCB8IDIgKy0KIHRlc3RjYXNlcy9saWIvdHN0X3Rlc3Quc2ggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jL3Rlc3Qtd3JpdGluZy1ndWlk
ZWxpbmVzLnR4dCBiL2RvYy90ZXN0LXdyaXRpbmctZ3VpZGVsaW5lcy50eHQKaW5kZXggZjE5MTJk
YzEyLi5mYzY0YjQxOGIgMTAwNjQ0Ci0tLSBhL2RvYy90ZXN0LXdyaXRpbmctZ3VpZGVsaW5lcy50
eHQKKysrIGIvZG9jL3Rlc3Qtd3JpdGluZy1ndWlkZWxpbmVzLnR4dApAQCAtMjExNSw4ICsyMTE1
LDggQEAgVGhlICd0c3RfbW91bnQnIG1vdW50cyAnJFRTVF9ERVZJQ0UnIG9mICckVFNUX0ZTX1RZ
UEUnIChvcHRpb25hbCkgdG8KICckVFNUX01OVF9QQVJBTVMnLiBUaGUgJyRUU1RfTU5UUE9JTlQn
IGRpcmVjdG9yeSBpcyBjcmVhdGVkIGlmIGl0IGRpZG4ndAogZXhpc3QgcHJpb3IgdG8gdGhlIGZ1
bmN0aW9uIGNhbGwuCiAKLUlmIHRoZSBwYXRoIHBhc3NlZCB0byB0aGUgJ3RzdF91bW91bnQnIGlz
IG5vdCBtb3VudGVkIChwcmVzZW50IGluICcvcHJvYy9tb3VudHMnKQotaXQncyBub29wLgorSWYg
dGhlIHBhdGggcGFzc2VkIChvcHRpb25hbCwgZGVmYXVsdHMgdG8gJyRUU1RfREVWSUNFJykgdG8g
dGhlICd0c3RfdW1vdW50JyBpcworbm90IG1vdW50ZWQgKHByZXNlbnQgaW4gJy9wcm9jL21vdW50
cycpIGl0J3Mgbm9vcC4KIE90aGVyd2lzZSBpdCByZXRyaWVzIHRvIHVtb3VudCB0aGUgZmlsZXN5
c3RlbSBhIGZldyB0aW1lcyBvbiBhIGZhaWx1cmUsIHdoaWNoCiBpcyBhIHdvcmthcm91bmQgc2lu
Y2UgdGhlcmUgYXJlIGEgZGFlbW9ucyBkdW1iIGVub3VnaCB0byBwcm9iZSBhbGwgbmV3bHkKIG1v
dW50ZWQgZmlsZXN5c3RlbXMsIHdoaWNoIHByZXZlbnRzIHRoZW0gZnJvbSB1bW91bnRpbmcgc2hv
cnRseSBhZnRlciB0aGV5CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvY29tbWFuZHMvZGYvZGYwMS5z
aCBiL3Rlc3RjYXNlcy9jb21tYW5kcy9kZi9kZjAxLnNoCmluZGV4IDliMGJlNzZmZS4uMzg3Njgx
NmRjIDEwMDc1NQotLS0gYS90ZXN0Y2FzZXMvY29tbWFuZHMvZGYvZGYwMS5zaAorKysgYi90ZXN0
Y2FzZXMvY29tbWFuZHMvZGYvZGYwMS5zaApAQCAtMTgsNyArMTgsNyBAQAogCiBUU1RfQ05UPTEy
CiBUU1RfU0VUVVA9c2V0dXAKLVRTVF9DTEVBTlVQPWNsZWFudXAKK1RTVF9DTEVBTlVQPXRzdF91
bW91bnQKIFRTVF9URVNURlVOQz10ZXN0CiBUU1RfT1BUUz0iZjoiCiBUU1RfVVNBR0U9dXNhZ2UK
QEAgLTU0LDExICs1NCw2IEBAIHNldHVwKCkKIAlERl9GU19UWVBFPSQobW91bnQgfCBncmVwICIk
VFNUX0RFVklDRSIgfCBhd2sgJ3twcmludCAkNX0nKQogfQogCi1jbGVhbnVwKCkKLXsKLQl0c3Rf
dW1vdW50ICRUU1RfREVWSUNFCi19Ci0KIGRmX3Rlc3QoKQogewogCWxvY2FsIGNtZD0iJDEgLVAi
CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvY29tbWFuZHMvbWtmcy9ta2ZzMDEuc2ggYi90ZXN0Y2Fz
ZXMvY29tbWFuZHMvbWtmcy9ta2ZzMDEuc2gKaW5kZXggODhmN2YwYmFhLi4yOGFmODkwYjMgMTAw
NzU1Ci0tLSBhL3Rlc3RjYXNlcy9jb21tYW5kcy9ta2ZzL21rZnMwMS5zaAorKysgYi90ZXN0Y2Fz
ZXMvY29tbWFuZHMvbWtmcy9ta2ZzMDEuc2gKQEAgLTcxLDcgKzcxLDcgQEAgbWtmc192ZXJpZnlf
c2l6ZSgpCiB7CiAJdHN0X21vdW50CiAJbG9jYWwgYmxvY2tudW09YGRmIC1QIC1CIDFrIG1udHBv
aW50IHwgdGFpbCAtbjEgfCBhd2sgJ3twcmludCAkMn0nYAotCXRzdF91bW91bnQgIiRUU1RfREVW
SUNFIgorCXRzdF91bW91bnQKIAogCWlmIFsgJGJsb2NrbnVtIC1ndCAiJDIiIF07IHRoZW4KIAkJ
cmV0dXJuIDEKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5
L2ltYS90ZXN0cy9pbWFfc2V0dXAuc2ggYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVn
cml0eS9pbWEvdGVzdHMvaW1hX3NldHVwLnNoCmluZGV4IGNiZGVkNDJjMi4uZGE0OWViMWIyIDEw
MDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMv
aW1hX3NldHVwLnNoCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2lt
YS90ZXN0cy9pbWFfc2V0dXAuc2gKQEAgLTEwNSw3ICsxMDUsNyBAQCBpbWFfY2xlYW51cCgpCiAK
IAlpZiBbICIkVFNUX05FRURTX0RFVklDRSIgPSAxIF07IHRoZW4KIAkJY2QgJFRTVF9UTVBESVIK
LQkJdHN0X3Vtb3VudCAkVFNUX0RFVklDRQorCQl0c3RfdW1vdW50CiAJZmkKIH0KIApkaWZmIC0t
Z2l0IGEvdGVzdGNhc2VzL2xpYi90c3RfdGVzdC5zaCBiL3Rlc3RjYXNlcy9saWIvdHN0X3Rlc3Qu
c2gKaW5kZXggNTEyNzMyMzE1Li43NDAyNTNkZjEgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9saWIv
dHN0X3Rlc3Quc2gKKysrIGIvdGVzdGNhc2VzL2xpYi90c3RfdGVzdC5zaApAQCAtMjU5LDcgKzI1
OSw3IEBAIHRzdF9tb3VudCgpCiAKIHRzdF91bW91bnQoKQogewotCWxvY2FsIGRldmljZT0iJDEi
CisJbG9jYWwgZGV2aWNlPSIkezE6LSRUU1RfREVWSUNFfSIKIAlsb2NhbCBpPTAKIAogCWlmICEg
Z3JlcCAtcSAiJGRldmljZSIgL3Byb2MvbW91bnRzOyB0aGVuCi0tIAoyLjIxLjAKCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

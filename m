Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD05DCCE
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Apr 2019 09:28:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97ECE3EA219
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Apr 2019 09:28:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 279EB3EA0CD
 for <ltp@lists.linux.it>; Mon, 29 Apr 2019 09:28:10 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D00E91400C47
 for <ltp@lists.linux.it>; Mon, 29 Apr 2019 09:28:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B1FD6AEF7;
 Mon, 29 Apr 2019 07:28:07 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 29 Apr 2019 09:28:00 +0200
Message-Id: <20190429072800.23067-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429072800.23067-1-pvorel@suse.cz>
References: <20190429072800.23067-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] net/tracepath: Rewrite into new API
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

ZW5oYW5jZW1lbnRzOgoqIENoZWNrIGZvciB0cmFjZXBhdGggLTYgd2hlbiB0cmFjZXBhdGg2IG5v
dCBhdmFpbGFibGUKICB0cmFjZXBhdGg2IHdhcyByZW1vdmVkIGluIGlwdXRpbHMgczIwMTYxMTA1
IGFuZCByZXBsYWNlZCBieSB0cmFjZXBhdGggLTYsCiAgdGhpcyB3YXkgaXQncyBwb3J0YWJsZSBm
b3IgYm90aCBhbGwgaXB1dGlscyByZWxlYXNlcwoKKiBQcmludCB0cmFjZXBhdGggdmVyc2lvbiBp
ZiAtViBpcyBhdmFpbGFibGUgKGFkZGVkIGluIGlucHV0aWxzIHMyMDE5MDMyNCkKClNpZ25lZC1v
ZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgotLS0KIC4uLi9uZXR3b3JrL3RjcF9j
bWRzL3RyYWNlcGF0aC90cmFjZXBhdGgwMS5zaCB8IDYwICsrKysrKysrKy0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90ZXN0Y2FzZXMvbmV0d29yay90Y3BfY21kcy90cmFjZXBhdGgvdHJhY2VwYXRoMDEuc2gg
Yi90ZXN0Y2FzZXMvbmV0d29yay90Y3BfY21kcy90cmFjZXBhdGgvdHJhY2VwYXRoMDEuc2gKaW5k
ZXggZmNmZDU0YWZiLi4wMzdmY2EwNjYgMTAwNzU1Ci0tLSBhL3Rlc3RjYXNlcy9uZXR3b3JrL3Rj
cF9jbWRzL3RyYWNlcGF0aC90cmFjZXBhdGgwMS5zaAorKysgYi90ZXN0Y2FzZXMvbmV0d29yay90
Y3BfY21kcy90cmFjZXBhdGgvdHJhY2VwYXRoMDEuc2gKQEAgLTEsNTggKzEsNTYgQEAKICMhL2Jp
bi9zaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorIyBDb3B5
cmlnaHQgKGMpIDIwMTkgUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+CiAjIENvcHlyaWdodCAo
YykgMjAxNiBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLiBBbGwgUmlnaHRzIFJlc2VydmVk
LgotIwotIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yCi0jIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGFzCi0jIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mCi0jIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91
ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgotIwotIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJp
YnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3b3VsZCBiZSB1c2VmdWwsCi0jIGJ1dCBXSVRIT1VU
IEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCi0jIE1F
UkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0
aGUKLSMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KLSMKLSMg
WW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UKLSMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uIElmIG5vdCwgc2VlIDxodHRwOi8v
d3d3LmdudS5vcmcvbGljZW5zZXMvPi4KLSMKICMgQXV0aG9yOiBBbGV4ZXkgS29kYW5ldiA8YWxl
eGV5LmtvZGFuZXZAb3JhY2xlLmNvbT4KIAotVENJRD10cmFjZXBhdGgwMQotVFNUX1RPVEFMPTEK
LVRTVF9VU0VfTEVHQUNZX0FQST0xCitUU1RfVEVTVEZVTkM9ImRvX3Rlc3QiCitUU1RfU0VUVVA9
InNldHVwIgogLiB0c3RfbmV0LnNoCiAKLXRlc3RfdHJhY2VwYXRoKCkKK3NldHVwKCkKK3sKKwlj
bWQ9InRyYWNlcGF0aCIKKworCWlmIFsgIiRUU1RfSVBWNiIgXTsgdGhlbgorCQljbWQ9InRyYWNl
cGF0aCRUU1RfSVBWRVIiCisJCXRzdF9jbWRfYXZhaWxhYmxlICRjbWQgfHwgY21kPSJ0cmFjZXBh
dGggLTYiCisJZmkKKwl0c3RfdGVzdF9jbWRzICQoZWNobyAkY21kIHwgY3V0IC1mIDEgLWQnICcp
CisKKwlpZiAkY21kIC1WID4vZGV2L251bGwgMj4mMTsgdGhlbgorCQl0c3RfcmVzIFRJTkZPICJ0
cmFjZXJvdXRlIHZlcnNpb246IgorCQl0c3RfcmVzIFRJTkZPICQoJGNtZCAtViAyPiYxKQorCWZp
Cit9CisKK2RvX3Rlc3QoKQogewotCWxvY2FsIGNtZD0iJDEiCiAJbG9jYWwgbGVuPTEyODAKLQls
b2NhbCBvdXRwdXQ9Ci0JbG9jYWwgcmV0PTAKLQlsb2NhbCByaG9zdD0iJDIiCi0JdHN0X3Rlc3Rf
Y21kcyAiJGNtZCIKKwlsb2NhbCBvdXRwdXQKKwlsb2NhbCByaG9zdD0iJCh0c3RfaXBhZGRyIHJo
b3N0KSIKIAotCXRzdF9yZXNtIFRJTkZPICJ0ZXN0ICRjbWQgd2l0aCAkcmhvc3QsIHBtdHUgaXMg
JGxlbiIKKwl0c3RfcmVzIFRJTkZPICJ0ZXN0ICRjbWQgd2l0aCAkcmhvc3QsIHBtdHUgaXMgJGxl
biIKIAogCW91dHB1dD0kKCRjbWQgJHJob3N0IC1sICRsZW4gfCBncmVwICJwbXR1ICRsZW4iKQog
CWlmIFsgJD8gLW5lIDAgXTsgdGhlbgotCQl0c3RfcmVzbSBURkFJTCAiJGNtZCBmYWlsZWQ6IHBt
dHUgJGxlbiBub3QgZm91bmQgaW4gb3V0cHV0IgorCQl0c3RfcmVzIFRGQUlMICIkY21kIGZhaWxl
ZDogcG10dSAkbGVuIG5vdCBmb3VuZCBpbiBvdXRwdXQiCiAJCXJldHVybgogCWZpCiAKIAkjIFVz
dWFsbHkgb25seSBvbmUgaG9wIGlzIHJlcXVpcmVkIHRvIGdldCB0byByZW1vdGUgdGVzdCBtYWNo
aW5lCiAJaG9wc19udW09JChlY2hvICIkb3V0cHV0IiB8IHNlZCAtbkUgJ3MvLipob3BzIChbMC05
XSspLiovXDEvcCcpCiAJaWYgWyAteiAiJGhvcHNfbnVtIiBdOyB0aGVuCi0JCXRzdF9yZXNtIFRG
QUlMICJmYWlsZWQgdG8gdHJhY2UgcGF0aCB0byAnJHJob3N0JyIKKwkJdHN0X3JlcyBURkFJTCAi
ZmFpbGVkIHRvIHRyYWNlIHBhdGggdG8gJyRyaG9zdCciCiAJCXJldHVybgogCWZpCiAKIAlpZiBb
ICIkaG9wc19udW0iIC1lcSAwIF07IHRoZW4KLQkJdHN0X3Jlc20gVEZBSUwgImNhbid0IHRyYWNl
IHBhdGggdG8gJyRyaG9zdCcgaW4gMSsgaG9wcyIKKwkJdHN0X3JlcyBURkFJTCAiY2FuJ3QgdHJh
Y2UgcGF0aCB0byAnJHJob3N0JyBpbiAxKyBob3BzIgogCQlyZXR1cm4KIAlmaQogCi0JdHN0X3Jl
c20gVFBBU1MgInRyYWNlZCBwYXRoIHRvICckcmhvc3QnIGluICRob3BzX251bSBob3BzIgorCXRz
dF9yZXMgVFBBU1MgInRyYWNlZCBwYXRoIHRvICckcmhvc3QnIGluICRob3BzX251bSBob3BzIgog
fQogCi10ZXN0X3RyYWNlcGF0aCB0cmFjZXBhdGgkVFNUX0lQVjYgJCh0c3RfaXBhZGRyIHJob3N0
KQotCi10c3RfZXhpdAordHN0X3J1bgotLSAKMi4yMC4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

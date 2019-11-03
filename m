Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1FEDC67
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 11:23:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 174933C2705
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 11:23:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 266E43C23AB
 for <ltp@lists.linux.it>; Sun,  3 Nov 2019 23:24:27 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id F416B600A1F
 for <ltp@lists.linux.it>; Sun,  3 Nov 2019 23:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572819864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vVhIxhQEsZyMjNWM7r07m/bn2sVWEa+4xjPT6Lkq+3A=;
 b=BIepjlRcy68i5bUdbtIEhP+F6rTQSqWbYyrPu/uJalXsds606eo5cr+h+PCVFKrdfz43F1
 soBSSuMCfes0QsQz1iGVCkHy+Hn7nZ5rOb1VUUVz5CTplY79lv8O2u4nq+bE+qVpWiqg3a
 1EOc67ThMNczbaKaQLH4SeXXN2Sirss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-MqpvSF-uMh6Gw1D2RCT98A-1; Sun, 03 Nov 2019 17:24:21 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A85D180496F
 for <ltp@lists.linux.it>; Sun,  3 Nov 2019 22:24:20 +0000 (UTC)
Received: from [172.54.37.191] (cpt-1013.paas.prod.upshift.rdu2.redhat.com
 [10.0.19.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27E7E100EBA4;
 Sun,  3 Nov 2019 22:24:14 +0000 (UTC)
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: 
Date: Sun, 03 Nov 2019 22:24:14 -0000
Message-ID: <cki.6C94830761.U42EB9BZOK@redhat.com>
X-Gitlab-Pipeline-ID: 262184
X-Gitlab-Url: https://xci32.lab.eng.rdu2.redhat.com
X-Gitlab-Path: /cki-project/cki-pipeline/pipelines/262184
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: MqpvSF-uMh6Gw1D2RCT98A-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 04 Nov 2019 11:22:49 +0100
Subject: [LTP] =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E0-rc5-3a69c9e=2Ecki_=28mainline=2Ekernel=2Eorg=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CkhlbGxvLAoKV2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0
aGlzIGtlcm5lbCB0cmVlOgoKICAgICAgIEtlcm5lbCByZXBvOiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQKICAgICAgICAg
ICAgQ29tbWl0OiAzYTY5YzllNTIyOTUgLSBNZXJnZSB0YWcgJ3VzYi01LjQtcmM2JyBvZiBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ3JlZ2toL3VzYgoKVGhl
IHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4KCiAg
ICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKICAgICAgICAgICAg
IE1lcmdlOiBPSwogICAgICAgICAgIENvbXBpbGU6IE9LCiAgICAgICAgICAgICBUZXN0czogRkFJ
TEVECgpBbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcgZmlsZXMsIGFuZCBsb2dzIGFyZSBhdmFp
bGFibGUgZm9yIGRvd25sb2FkIGhlcmU6CgogIGh0dHBzOi8vYXJ0aWZhY3RzLmNraS1wcm9qZWN0
Lm9yZy9waXBlbGluZXMvMjYyMTg0CgpPbmUgb3IgbW9yZSBrZXJuZWwgdGVzdHMgZmFpbGVkOgoK
ICAgIHg4Nl82NDoKICAgICDinYwgTFRQIGxpdGUKCldlIGhvcGUgdGhhdCB0aGVzZSBsb2dzIGNh
biBoZWxwIHlvdSBmaW5kIHRoZSBwcm9ibGVtIHF1aWNrbHkuIEZvciB0aGUgZnVsbApkZXRhaWwg
b24gb3VyIHRlc3RpbmcgcHJvY2VkdXJlcywgcGxlYXNlIHNjcm9sbCB0byB0aGUgYm90dG9tIG9m
IHRoaXMgbWVzc2FnZS4KClBsZWFzZSByZXBseSB0byB0aGlzIGVtYWlsIGlmIHlvdSBoYXZlIGFu
eSBxdWVzdGlvbnMgYWJvdXQgdGhlIHRlc3RzIHRoYXQgd2UKcmFuIG9yIGlmIHlvdSBoYXZlIGFu
eSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gbWFrZSBmdXR1cmUgdGVzdHMgbW9yZSBlZmZlY3RpdmUu
CgogICAgICAgICwtLiAgICwtLgogICAgICAgKCBDICkgKCBLICkgIENvbnRpbnVvdXMKICAgICAg
ICBgLScsLS5gLScgICBLZXJuZWwKICAgICAgICAgICggSSApICAgICBJbnRlZ3JhdGlvbgogICAg
ICAgICAgIGAtJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCkNvbXBpbGUgdGVzdGluZwotLS0tLS0t
LS0tLS0tLS0KCldlIGNvbXBpbGVkIHRoZSBrZXJuZWwgZm9yIDEgYXJjaGl0ZWN0dXJlOgoKICAg
IHg4Nl82NDoKICAgICAgbWFrZSBvcHRpb25zOiAtajMwIElOU1RBTExfTU9EX1NUUklQPTEgdGFy
Z3otcGtnCgoKSGFyZHdhcmUgdGVzdGluZwotLS0tLS0tLS0tLS0tLS0tCldlIGJvb3RlZCBlYWNo
IGtlcm5lbCBhbmQgcmFuIHRoZSBmb2xsb3dpbmcgdGVzdHM6CgogIHg4Nl82NDoKICAgIEhvc3Qg
MToKICAgICAgIOKchSBCb290IHRlc3QKICAgICAgIOKchSBQb2RtYW4gc3lzdGVtIGludGVncmF0
aW9uIHRlc3QgKGFzIHJvb3QpCiAgICAgICDinIUgUG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0
ZXN0IChhcyB1c2VyKQogICAgICAg4p2MIExUUCBsaXRlCiAgICAgICDimqHimqHimqEgTG9vcGRl
diBTYW5pdHkKICAgICAgIOKaoeKaoeKaoSBqdm0gdGVzdCBzdWl0ZQogICAgICAg4pqh4pqh4pqh
IE1lbW9yeSBmdW5jdGlvbjogbWVtZmRfY3JlYXRlCiAgICAgICDimqHimqHimqEgTWVtb3J5IGZ1
bmN0aW9uOiBrYXNscgogICAgICAg4pqh4pqh4pqhIEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVz
dCBVdGlsaXR5KQogICAgICAg4pqh4pqh4pqhIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGUKICAg
ICAgIOKaoeKaoeKaoSBFdGhlcm5ldCBkcml2ZXJzIHNhbml0eQogICAgICAg4pqh4pqh4pqhIE5l
dHdvcmtpbmcgTUFDc2VjOiBzYW5pdHkKICAgICAgIOKaoeKaoeKaoSBOZXR3b3JraW5nIHNvY2tl
dDogZnV6egogICAgICAg4pqh4pqh4pqhIE5ldHdvcmtpbmcgc2N0cC1hdXRoOiBzb2Nrb3B0cyB0
ZXN0CiAgICAgICDimqHimqHimqEgTmV0d29ya2luZzogaWdtcCBjb25mb3JtYW5jZSB0ZXN0CiAg
ICAgICDimqHimqHimqEgTmV0d29ya2luZyByb3V0ZTogcG10dQogICAgICAg4pqh4pqh4pqhIE5l
dHdvcmtpbmcgVENQOiBrZWVwYWxpdmUgdGVzdAogICAgICAg4pqh4pqh4pqhIE5ldHdvcmtpbmcg
VURQOiBzb2NrZXQKICAgICAgIOKaoeKaoeKaoSBOZXR3b3JraW5nIHR1bm5lbDogZ2VuZXZlIGJh
c2ljIHRlc3QKICAgICAgIOKaoeKaoeKaoSBOZXR3b3JraW5nIHR1bm5lbDogZ3JlIGJhc2ljCiAg
ICAgICDimqHimqHimqEgTmV0d29ya2luZyB0dW5uZWw6IHZ4bGFuIGJhc2ljCiAgICAgICDimqHi
mqHimqEgYXVkaXQ6IGF1ZGl0IHRlc3RzdWl0ZSB0ZXN0CiAgICAgICDimqHimqHimqEgaHR0cGQ6
IG1vZF9zc2wgc21va2Ugc2FuaXR5CiAgICAgICDimqHimqHimqEgaW90b3A6IHNhbml0eQogICAg
ICAg4pqh4pqh4pqhIHR1bmVkOiB0dW5lLXByb2Nlc3Nlcy10aHJvdWdoLXBlcmYKICAgICAgIOKa
oeKaoeKaoSBwY2l1dGlsczogc2FuaXR5IHNtb2tlIHRlc3QKICAgICAgIOKaoeKaoeKaoSBBTFNB
IFBDTSBsb29wYmFjayB0ZXN0CiAgICAgICDimqHimqHimqEgQUxTQSBDb250cm9sIChtaXhlcikg
VXNlcnNwYWNlIEVsZW1lbnQgdGVzdAogICAgICAg4pqh4pqh4pqhIFVzZXggLSB2ZXJzaW9uIDEu
OS0yOQogICAgICAg4pqh4pqh4pqhIHN0b3JhZ2U6IFNDU0kgVlBECiAgICAgICDimqHimqHimqEg
c3RyZXNzOiBzdHJlc3MtbmcKICAgICAgIOKaoeKaoeKaoSB0cmFjZTogZnRyYWNlL3RyYWNlcgog
ICAgICAg8J+apyDimqHimqHimqEgQ0lGUyBDb25uZWN0YXRob24KICAgICAgIPCfmqcg4pqh4pqh
4pqhIFBPU0lYIHBqZC1mc3Rlc3Qgc3VpdGVzCiAgICAgICDwn5qnIOKaoeKaoeKaoSBOZXR3b3Jr
aW5nIGJyaWRnZTogc2FuaXR5CiAgICAgICDwn5qnIOKaoeKaoeKaoSBOZXR3b3JraW5nIHJvdXRl
X2Z1bmM6IGxvY2FsCiAgICAgICDimqHimqHimqEgTmV0d29ya2luZyByb3V0ZV9mdW5jOiBmb3J3
YXJkCiAgICAgICDwn5qnIOKaoeKaoeKaoSBMMlRQIGJhc2ljIHRlc3QKICAgICAgIPCfmqcg4pqh
4pqh4pqhIE5ldHdvcmtpbmcgdm5pYzogaXB2bGFuL2Jhc2ljCiAgICAgICDwn5qnIOKaoeKaoeKa
oSBzdG9yYWdlOiBkbS9jb21tb24KICAgICAgIPCfmqcg4pqh4pqh4pqhIE5ldHdvcmtpbmcgaXBz
ZWM6IGJhc2ljIG5ldG5zIHRyYW5zcG9ydAogICAgICAg8J+apyDimqHimqHimqEgTmV0d29ya2lu
ZyBpcHNlYzogYmFzaWMgbmV0bnMgdHVubmVsCgogICAgSG9zdCAyOgogICAgICAg4pyFIEJvb3Qg
dGVzdAogICAgICAg8J+apyDinIUgSVBNSSBkcml2ZXIgdGVzdAogICAgICAg8J+apyDinIUgSVBN
SXRvb2wgbG9vcCBzdHJlc3MgdGVzdAoKICAgIEhvc3QgMzoKICAgICAgIOKchSBCb290IHRlc3QK
ICAgICAgIOKchSB4ZnN0ZXN0czogZXh0NAogICAgICAg4pyFIHhmc3Rlc3RzOiB4ZnMKICAgICAg
IOKchSBzZWxpbnV4LXBvbGljeTogc2VyZ2UtdGVzdHN1aXRlCiAgICAgICDinIUgbHZtIHRoaW5w
IHNhbml0eQogICAgICAg4pyFIHN0b3JhZ2U6IHNvZnR3YXJlIFJBSUQgdGVzdGluZwogICAgICAg
8J+apyDinIUgSU9NTVUgYm9vdCB0ZXN0CiAgICAgICDwn5qnIOKchSBTdG9yYWdlIGJsa3Rlc3Rz
CgogIFRlc3Qgc291cmNlczogaHR0cHM6Ly9naXRodWIuY29tL0NLSS1wcm9qZWN0L3Rlc3RzLWJl
YWtlcgogICAg8J+SmiBQdWxsIHJlcXVlc3RzIGFyZSB3ZWxjb21lIGZvciBuZXcgdGVzdHMgb3Ig
aW1wcm92ZW1lbnRzIHRvIGV4aXN0aW5nIHRlc3RzIQoKV2FpdmVkIHRlc3RzCi0tLS0tLS0tLS0t
LQpJZiB0aGUgdGVzdCBydW4gaW5jbHVkZWQgd2FpdmVkIHRlc3RzLCB0aGV5IGFyZSBtYXJrZWQg
d2l0aCDwn5qnLiBTdWNoIHRlc3RzIGFyZQpleGVjdXRlZCBidXQgdGhlaXIgcmVzdWx0cyBhcmUg
bm90IHRha2VuIGludG8gYWNjb3VudC4gVGVzdHMgYXJlIHdhaXZlZCB3aGVuCnRoZWlyIHJlc3Vs
dHMgYXJlIG5vdCByZWxpYWJsZSBlbm91Z2gsIGUuZy4gd2hlbiB0aGV5J3JlIGp1c3QgaW50cm9k
dWNlZCBvciBhcmUKYmVpbmcgZml4ZWQuCgpUZXN0aW5nIHRpbWVvdXQKLS0tLS0tLS0tLS0tLS0t
CldlIGFpbSB0byBwcm92aWRlIGEgcmVwb3J0IHdpdGhpbiByZWFzb25hYmxlIHRpbWVmcmFtZS4g
VGVzdHMgdGhhdCBoYXZlbid0CmZpbmlzaGVkIHJ1bm5pbmcgYXJlIG1hcmtlZCB3aXRoIOKPsS4g
UmVwb3J0cyBmb3Igbm9uLXVwc3RyZWFtIGtlcm5lbHMgaGF2ZQphIEJlYWtlciByZWNpcGUgbGlu
a2VkIHRvIG5leHQgdG8gZWFjaCBob3N0LgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

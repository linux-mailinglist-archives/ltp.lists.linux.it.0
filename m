Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C81EDC69
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 11:23:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C49563C2455
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 11:23:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3790D3C2416
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 07:38:30 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 735C21A00E31
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 07:38:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572849506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FiEkhYA5Wom50kfwN9phT81mNfJcxY6VSqsTmLrM0+o=;
 b=gQOv7muE2cnAA/JZ03xnnEtpPhhh/3HK/d3gBbwRUr3UMve5AsLbjR9yB4QWC+sRoXhsBy
 VqdtsB/5aFfwdYEOmnAYntdnu/D/k348hH+8OKKefre1ZAY0sDkOzDo59Sv95zgMHtK8JD
 hifxTBopfKfNvd56EnwboQSG12O724I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-HX50M4CfO3OO86WT2bKe3g-1; Mon, 04 Nov 2019 01:38:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89430800A02
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 06:38:22 +0000 (UTC)
Received: from [172.54.37.191] (cpt-1013.paas.prod.upshift.rdu2.redhat.com
 [10.0.19.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4783A6085E;
 Mon,  4 Nov 2019 06:38:14 +0000 (UTC)
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: 
Date: Mon, 04 Nov 2019 06:38:14 -0000
Message-ID: <cki.B4B88A0CA9.1J5XMA7K2G@redhat.com>
X-Gitlab-Pipeline-ID: 262598
X-Gitlab-Url: https://xci32.lab.eng.rdu2.redhat.com
X-Gitlab-Path: /cki-project/cki-pipeline/pipelines/262598
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: HX50M4CfO3OO86WT2bKe3g-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 04 Nov 2019 11:22:49 +0100
Subject: [LTP] =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E0-rc6-a99d808=2Ecki_=28mainline=2Ekernel=2Eorg=29?=
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
Cc: Zorro Lang <zlong@redhat.com>, Memory Management <mm-qe@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CkhlbGxvLAoKV2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0
aGlzIGtlcm5lbCB0cmVlOgoKICAgICAgIEtlcm5lbCByZXBvOiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQKICAgICAgICAg
ICAgQ29tbWl0OiBhOTlkODA4MGFhZjMgLSBMaW51eCA1LjQtcmM2CgpUaGUgcmVzdWx0cyBvZiB0
aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93LgoKICAgIE92ZXJhbGwgcmVz
dWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQogICAgICAgICAgICAgTWVyZ2U6IE9LCiAg
ICAgICAgICAgQ29tcGlsZTogT0sKICAgICAgICAgICAgIFRlc3RzOiBGQUlMRUQKCkFsbCBrZXJu
ZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxlcywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IgZG93
bmxvYWQgaGVyZToKCiAgaHR0cHM6Ly9hcnRpZmFjdHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5l
cy8yNjI1OTgKCk9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6CgogICAgeDg2XzY0Ogog
ICAgIOKdjCBMVFAgbGl0ZQoKV2UgaG9wZSB0aGF0IHRoZXNlIGxvZ3MgY2FuIGhlbHAgeW91IGZp
bmQgdGhlIHByb2JsZW0gcXVpY2tseS4gRm9yIHRoZSBmdWxsCmRldGFpbCBvbiBvdXIgdGVzdGlu
ZyBwcm9jZWR1cmVzLCBwbGVhc2Ugc2Nyb2xsIHRvIHRoZSBib3R0b20gb2YgdGhpcyBtZXNzYWdl
LgoKUGxlYXNlIHJlcGx5IHRvIHRoaXMgZW1haWwgaWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucyBh
Ym91dCB0aGUgdGVzdHMgdGhhdCB3ZQpyYW4gb3IgaWYgeW91IGhhdmUgYW55IHN1Z2dlc3Rpb25z
IG9uIGhvdyB0byBtYWtlIGZ1dHVyZSB0ZXN0cyBtb3JlIGVmZmVjdGl2ZS4KCiAgICAgICAgLC0u
ICAgLC0uCiAgICAgICAoIEMgKSAoIEsgKSAgQ29udGludW91cwogICAgICAgIGAtJywtLmAtJyAg
IEtlcm5lbAogICAgICAgICAgKCBJICkgICAgIEludGVncmF0aW9uCiAgICAgICAgICAgYC0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwoKQ29tcGlsZSB0ZXN0aW5nCi0tLS0tLS0tLS0tLS0tLQoKV2Ug
Y29tcGlsZWQgdGhlIGtlcm5lbCBmb3IgMSBhcmNoaXRlY3R1cmU6CgogICAgeDg2XzY0OgogICAg
ICBtYWtlIG9wdGlvbnM6IC1qMzAgSU5TVEFMTF9NT0RfU1RSSVA9MSB0YXJnei1wa2cKCgpIYXJk
d2FyZSB0ZXN0aW5nCi0tLS0tLS0tLS0tLS0tLS0KV2UgYm9vdGVkIGVhY2gga2VybmVsIGFuZCBy
YW4gdGhlIGZvbGxvd2luZyB0ZXN0czoKCiAgeDg2XzY0OgogICAgSG9zdCAxOgogICAgICAg4pyF
IEJvb3QgdGVzdAogICAgICAg4pyFIHhmc3Rlc3RzOiBleHQ0CiAgICAgICDinIUgeGZzdGVzdHM6
IHhmcwogICAgICAg4pyFIHNlbGludXgtcG9saWN5OiBzZXJnZS10ZXN0c3VpdGUKICAgICAgIOKc
hSBsdm0gdGhpbnAgc2FuaXR5CiAgICAgICDinIUgc3RvcmFnZTogc29mdHdhcmUgUkFJRCB0ZXN0
aW5nCiAgICAgICDwn5qnIOKchSBJT01NVSBib290IHRlc3QKICAgICAgIPCfmqcg4pyFIFN0b3Jh
Z2UgYmxrdGVzdHMKCiAgICBIb3N0IDI6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDinIUg
UG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0ZXN0IChhcyByb290KQogICAgICAg4pyFIFBvZG1h
biBzeXN0ZW0gaW50ZWdyYXRpb24gdGVzdCAoYXMgdXNlcikKICAgICAgIOKdjCBMVFAgbGl0ZQog
ICAgICAg4pyFIExvb3BkZXYgU2FuaXR5CiAgICAgICDinIUganZtIHRlc3Qgc3VpdGUKICAgICAg
IOKchSBNZW1vcnkgZnVuY3Rpb246IG1lbWZkX2NyZWF0ZQogICAgICAg4pyFIE1lbW9yeSBmdW5j
dGlvbjoga2FzbHIKICAgICAgIOKchSBBTVRVIChBYnN0cmFjdCBNYWNoaW5lIFRlc3QgVXRpbGl0
eSkKICAgICAgIOKchSBMVFA6IG9wZW5wb3NpeCB0ZXN0IHN1aXRlCiAgICAgICDinIUgRXRoZXJu
ZXQgZHJpdmVycyBzYW5pdHkKICAgICAgIOKchSBOZXR3b3JraW5nIE1BQ3NlYzogc2FuaXR5CiAg
ICAgICDinIUgTmV0d29ya2luZyBzb2NrZXQ6IGZ1enoKICAgICAgIOKchSBOZXR3b3JraW5nIHNj
dHAtYXV0aDogc29ja29wdHMgdGVzdAogICAgICAg4pyFIE5ldHdvcmtpbmc6IGlnbXAgY29uZm9y
bWFuY2UgdGVzdAogICAgICAg4pyFIE5ldHdvcmtpbmcgcm91dGU6IHBtdHUKICAgICAgIOKchSBO
ZXR3b3JraW5nIFRDUDoga2VlcGFsaXZlIHRlc3QKICAgICAgIOKchSBOZXR3b3JraW5nIFVEUDog
c29ja2V0CiAgICAgICDinIUgTmV0d29ya2luZyB0dW5uZWw6IGdlbmV2ZSBiYXNpYyB0ZXN0CiAg
ICAgICDinIUgTmV0d29ya2luZyB0dW5uZWw6IGdyZSBiYXNpYwogICAgICAg4pyFIE5ldHdvcmtp
bmcgdHVubmVsOiB2eGxhbiBiYXNpYwogICAgICAg4pyFIGF1ZGl0OiBhdWRpdCB0ZXN0c3VpdGUg
dGVzdAogICAgICAg4pyFIGh0dHBkOiBtb2Rfc3NsIHNtb2tlIHNhbml0eQogICAgICAg4pyFIGlv
dG9wOiBzYW5pdHkKICAgICAgIOKchSB0dW5lZDogdHVuZS1wcm9jZXNzZXMtdGhyb3VnaC1wZXJm
CiAgICAgICDinIUgcGNpdXRpbHM6IHNhbml0eSBzbW9rZSB0ZXN0CiAgICAgICDinIUgQUxTQSBQ
Q00gbG9vcGJhY2sgdGVzdAogICAgICAg4pyFIEFMU0EgQ29udHJvbCAobWl4ZXIpIFVzZXJzcGFj
ZSBFbGVtZW50IHRlc3QKICAgICAgIOKchSBVc2V4IC0gdmVyc2lvbiAxLjktMjkKICAgICAgIOKc
hSBzdG9yYWdlOiBTQ1NJIFZQRAogICAgICAg4pyFIHN0cmVzczogc3RyZXNzLW5nCiAgICAgICDi
nIUgdHJhY2U6IGZ0cmFjZS90cmFjZXIKICAgICAgIPCfmqcg4pyFIENJRlMgQ29ubmVjdGF0aG9u
CiAgICAgICDwn5qnIOKdjCBQT1NJWCBwamQtZnN0ZXN0IHN1aXRlcwogICAgICAg8J+apyDinIUg
TmV0d29ya2luZyBicmlkZ2U6IHNhbml0eQogICAgICAg8J+apyDinIUgTmV0d29ya2luZyByb3V0
ZV9mdW5jOiBsb2NhbAogICAgICAg4pyFIE5ldHdvcmtpbmcgcm91dGVfZnVuYzogZm9yd2FyZAog
ICAgICAg8J+apyDinIUgTDJUUCBiYXNpYyB0ZXN0CiAgICAgICDwn5qnIOKchSBOZXR3b3JraW5n
IHZuaWM6IGlwdmxhbi9iYXNpYwogICAgICAg8J+apyDinIUgc3RvcmFnZTogZG0vY29tbW9uCiAg
ICAgICDwn5qnIOKchSBOZXR3b3JraW5nIGlwc2VjOiBiYXNpYyBuZXRucyB0cmFuc3BvcnQKICAg
ICAgIPCfmqcg4pyFIE5ldHdvcmtpbmcgaXBzZWM6IGJhc2ljIG5ldG5zIHR1bm5lbAoKICAgIEhv
c3QgMzoKICAgICAgIOKchSBCb290IHRlc3QKICAgICAgIPCfmqcg4pyFIElQTUkgZHJpdmVyIHRl
c3QKICAgICAgIPCfmqcg4pyFIElQTUl0b29sIGxvb3Agc3RyZXNzIHRlc3QKCiAgVGVzdCBzb3Vy
Y2VzOiBodHRwczovL2dpdGh1Yi5jb20vQ0tJLXByb2plY3QvdGVzdHMtYmVha2VyCiAgICDwn5Ka
IFB1bGwgcmVxdWVzdHMgYXJlIHdlbGNvbWUgZm9yIG5ldyB0ZXN0cyBvciBpbXByb3ZlbWVudHMg
dG8gZXhpc3RpbmcgdGVzdHMhCgpXYWl2ZWQgdGVzdHMKLS0tLS0tLS0tLS0tCklmIHRoZSB0ZXN0
IHJ1biBpbmNsdWRlZCB3YWl2ZWQgdGVzdHMsIHRoZXkgYXJlIG1hcmtlZCB3aXRoIPCfmqcuIFN1
Y2ggdGVzdHMgYXJlCmV4ZWN1dGVkIGJ1dCB0aGVpciByZXN1bHRzIGFyZSBub3QgdGFrZW4gaW50
byBhY2NvdW50LiBUZXN0cyBhcmUgd2FpdmVkIHdoZW4KdGhlaXIgcmVzdWx0cyBhcmUgbm90IHJl
bGlhYmxlIGVub3VnaCwgZS5nLiB3aGVuIHRoZXkncmUganVzdCBpbnRyb2R1Y2VkIG9yIGFyZQpi
ZWluZyBmaXhlZC4KClRlc3RpbmcgdGltZW91dAotLS0tLS0tLS0tLS0tLS0KV2UgYWltIHRvIHBy
b3ZpZGUgYSByZXBvcnQgd2l0aGluIHJlYXNvbmFibGUgdGltZWZyYW1lLiBUZXN0cyB0aGF0IGhh
dmVuJ3QKZmluaXNoZWQgcnVubmluZyBhcmUgbWFya2VkIHdpdGgg4o+xLiBSZXBvcnRzIGZvciBu
b24tdXBzdHJlYW0ga2VybmVscyBoYXZlCmEgQmVha2VyIHJlY2lwZSBsaW5rZWQgdG8gbmV4dCB0
byBlYWNoIGhvc3QuCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=

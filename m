Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FDE11311A
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 18:52:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9375F3C249F
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 18:52:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4746F3C246C
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 18:52:29 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 92D5960005F
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 18:52:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575481946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iTriTHqVx2rkKEgms4iq+B/9ioPSmwqJJ4zthjMryXY=;
 b=BUx8F+Lh2coKaHHjWiQsKeJBScyGHYuP5jYmPsonPDKuANeg38U04XcnWYUEeNkih2aERv
 EShD/notczavzc1ZFdVF8C/ReCX+fgRIzIyEqz3pfbloMQKkDf2v0iBbHBp3KOlKpxLr96
 6Wvw4vLmRP7ok1hWNGZggK0El+HboSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-WuT-GCzrMIqOaWLOVHuf1Q-1; Wed, 04 Dec 2019 12:52:17 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BB5B800D5C
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 17:52:17 +0000 (UTC)
Received: from [172.54.108.34] (cpt-1042.paas.prod.upshift.rdu2.redhat.com
 [10.0.19.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FE3C5D6AE;
 Wed,  4 Dec 2019 17:52:08 +0000 (UTC)
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: Kernel RT Team <kernel-rt-ci@redhat.com>
Date: Wed, 04 Dec 2019 17:52:08 -0000
Message-ID: <cki.A05205186F.8840CLEZ0B@redhat.com>
X-Gitlab-Pipeline-ID: 323141
X-Gitlab-Url: https://xci32.lab.eng.rdu2.redhat.com
X-Gitlab-Path: /cki-project/cki-pipeline/pipelines/323141
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: WuT-GCzrMIqOaWLOVHuf1Q-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E2?=
 =?utf-8?q?=2E21-rt14-eccdce6=2Ecki_=28rt-devel=29?=
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
aGlzIGtlcm5lbCB0cmVlOgoKICAgICAgIEtlcm5lbCByZXBvOiBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcnQvbGludXgtcnQtZGV2ZWwuZ2l0CiAgICAgICAg
ICAgIENvbW1pdDogZWNjZGNlNmNiNTI2IC0gdjUuMi4yMS1ydDE0CgpUaGUgcmVzdWx0cyBvZiB0
aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93LgoKICAgIE92ZXJhbGwgcmVz
dWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQogICAgICAgICAgICAgTWVyZ2U6IE9LCiAg
ICAgICAgICAgQ29tcGlsZTogT0sKICAgICAgICAgICAgIFRlc3RzOiBGQUlMRUQKCiAgICBQaXBl
bGluZTogaHR0cHM6Ly94Y2kzMi5sYWIuZW5nLnJkdTIucmVkaGF0LmNvbS9ja2ktcHJvamVjdC9j
a2ktcGlwZWxpbmUvcGlwZWxpbmVzLzMyMzE0MQoKT25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZh
aWxlZDoKCiAgICB4ODZfNjQ6CiAgICAg4p2MIExUUAoKV2UgaG9wZSB0aGF0IHRoZXNlIGxvZ3Mg
Y2FuIGhlbHAgeW91IGZpbmQgdGhlIHByb2JsZW0gcXVpY2tseS4gRm9yIHRoZSBmdWxsCmRldGFp
bCBvbiBvdXIgdGVzdGluZyBwcm9jZWR1cmVzLCBwbGVhc2Ugc2Nyb2xsIHRvIHRoZSBib3R0b20g
b2YgdGhpcyBtZXNzYWdlLgoKUGxlYXNlIHJlcGx5IHRvIHRoaXMgZW1haWwgaWYgeW91IGhhdmUg
YW55IHF1ZXN0aW9ucyBhYm91dCB0aGUgdGVzdHMgdGhhdCB3ZQpyYW4gb3IgaWYgeW91IGhhdmUg
YW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBtYWtlIGZ1dHVyZSB0ZXN0cyBtb3JlIGVmZmVjdGl2
ZS4KCiAgICAgICAgLC0uICAgLC0uCiAgICAgICAoIEMgKSAoIEsgKSAgQ29udGludW91cwogICAg
ICAgIGAtJywtLmAtJyAgIEtlcm5lbAogICAgICAgICAgKCBJICkgICAgIEludGVncmF0aW9uCiAg
ICAgICAgICAgYC0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQ29tcGlsZSB0ZXN0aW5nCi0tLS0t
LS0tLS0tLS0tLQoKV2UgY29tcGlsZWQgdGhlIGtlcm5lbCBmb3IgMSBhcmNoaXRlY3R1cmU6Cgog
ICAgeDg2XzY0OgogICAgICBtYWtlIG9wdGlvbnM6IC1qMzAgSU5TVEFMTF9NT0RfU1RSSVA9MSB0
YXJnei1wa2cKCgpIYXJkd2FyZSB0ZXN0aW5nCi0tLS0tLS0tLS0tLS0tLS0KQWxsIHRoZSB0ZXN0
aW5nIGpvYnMgYXJlIGxpc3RlZCBoZXJlOgoKICBodHRwczovL2JlYWtlci5lbmdpbmVlcmluZy5y
ZWRoYXQuY29tL2pvYnMvP2pvYnNlYXJjaC0wLnRhYmxlPVdoaXRlYm9hcmQmam9ic2VhcmNoLTAu
b3BlcmF0aW9uPWNvbnRhaW5zJmpvYnNlYXJjaC0wLnZhbHVlPWNraSU0MGdpdGxhYiUzQTMyMzE0
MQoKV2UgYm9vdGVkIGVhY2gga2VybmVsIGFuZCByYW4gdGhlIGZvbGxvd2luZyB0ZXN0czoKCiAg
eDg2XzY0OgogICAgSG9zdCAxOiBodHRwczovL2JlYWtlci5lbmdpbmVlcmluZy5yZWRoYXQuY29t
L3JlY2lwZXMvNzY1MTAzNQogICAgICAg4pyFIEJvb3QgdGVzdAogICAgICAg4pyFIFBvZG1hbiBz
eXN0ZW0gaW50ZWdyYXRpb24gdGVzdCAoYXMgcm9vdCkKICAgICAgIOKchSBQb2RtYW4gc3lzdGVt
IGludGVncmF0aW9uIHRlc3QgKGFzIHVzZXIpCiAgICAgICDinYwgTFRQCiAgICAgICDinIUgTG9v
cGRldiBTYW5pdHkKICAgICAgIOKchSBNZW1vcnkgZnVuY3Rpb246IG1lbWZkX2NyZWF0ZQogICAg
ICAg4pyFIE1lbW9yeSBmdW5jdGlvbjoga2FzbHIKICAgICAgIOKchSBBTVRVIChBYnN0cmFjdCBN
YWNoaW5lIFRlc3QgVXRpbGl0eSkKICAgICAgIOKchSBOZXR3b3JraW5nIGJyaWRnZTogc2FuaXR5
CiAgICAgICDinIUgRXRoZXJuZXQgZHJpdmVycyBzYW5pdHkKICAgICAgIOKchSBOZXR3b3JraW5n
IE1BQ3NlYzogc2FuaXR5CiAgICAgICDinIUgTmV0d29ya2luZyBzb2NrZXQ6IGZ1enoKICAgICAg
IOKchSBOZXR3b3JraW5nIHNjdHAtYXV0aDogc29ja29wdHMgdGVzdAogICAgICAg4pyFIE5ldHdv
cmtpbmc6IGlnbXAgY29uZm9ybWFuY2UgdGVzdAogICAgICAg4pyFIE5ldHdvcmtpbmcgcm91dGU6
IHBtdHUKICAgICAgIOKchSBOZXR3b3JraW5nIHJvdXRlX2Z1bmM6IGxvY2FsCiAgICAgICDinIUg
TmV0d29ya2luZyByb3V0ZV9mdW5jOiBmb3J3YXJkCiAgICAgICDinIUgTmV0d29ya2luZyBUQ1A6
IGtlZXBhbGl2ZSB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZyBVRFA6IHNvY2tldAogICAgICAg
4pyFIE5ldHdvcmtpbmcgdHVubmVsOiBnZW5ldmUgYmFzaWMgdGVzdAogICAgICAg4pyFIE5ldHdv
cmtpbmcgdHVubmVsOiBncmUgYmFzaWMKICAgICAgIOKchSBMMlRQIGJhc2ljIHRlc3QKICAgICAg
IOKchSBOZXR3b3JraW5nIHR1bm5lbDogdnhsYW4gYmFzaWMKICAgICAgIOKchSBOZXR3b3JraW5n
IGlwc2VjOiBiYXNpYyBuZXRucyB0cmFuc3BvcnQKICAgICAgIOKchSBOZXR3b3JraW5nIGlwc2Vj
OiBiYXNpYyBuZXRucyB0dW5uZWwKICAgICAgIOKchSBhdWRpdDogYXVkaXQgdGVzdHN1aXRlIHRl
c3QKICAgICAgIOKchSBodHRwZDogbW9kX3NzbCBzbW9rZSBzYW5pdHkKICAgICAgIOKchSB0dW5l
ZDogdHVuZS1wcm9jZXNzZXMtdGhyb3VnaC1wZXJmCiAgICAgICDinIUgcGNpdXRpbHM6IHNhbml0
eSBzbW9rZSB0ZXN0CiAgICAgICDinIUgQUxTQSBQQ00gbG9vcGJhY2sgdGVzdAogICAgICAg4pyF
IEFMU0EgQ29udHJvbCAobWl4ZXIpIFVzZXJzcGFjZSBFbGVtZW50IHRlc3QKICAgICAgIOKchSBz
dG9yYWdlOiBTQ1NJIFZQRAogICAgICAg4pyFIHN0cmVzczogc3RyZXNzLW5nCiAgICAgICDinIUg
dHJhY2U6IGZ0cmFjZS90cmFjZXIKICAgICAgIPCfmqcg4pyFIENJRlMgQ29ubmVjdGF0aG9uCiAg
ICAgICDwn5qnIOKchSBQT1NJWCBwamQtZnN0ZXN0IHN1aXRlcwogICAgICAg8J+apyDinIUganZt
IHRlc3Qgc3VpdGUKICAgICAgIPCfmqcg4pyFIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGUKICAg
ICAgIPCfmqcg4pyFIE5ldHdvcmtpbmcgdm5pYzogaXB2bGFuL2Jhc2ljCiAgICAgICDwn5qnIOKc
hSBpb3RvcDogc2FuaXR5CiAgICAgICDwn5qnIOKchSBVc2V4IC0gdmVyc2lvbiAxLjktMjkKICAg
ICAgIPCfmqcg4pyFIHN0b3JhZ2U6IGRtL2NvbW1vbgoKICAgIEhvc3QgMjogaHR0cHM6Ly9iZWFr
ZXIuZW5naW5lZXJpbmcucmVkaGF0LmNvbS9yZWNpcGVzLzc2NTEwMzcKICAgICAgIOKchSBCb290
IHRlc3QKICAgICAgIOKchSBTdG9yYWdlIFNBTiBkZXZpY2Ugc3RyZXNzIC0gbWVnYXJhaWRfc2Fz
CgogICAgSG9zdCAzOiBodHRwczovL2JlYWtlci5lbmdpbmVlcmluZy5yZWRoYXQuY29tL3JlY2lw
ZXMvNzY1MTAzNgogICAgICAg4pyFIEJvb3QgdGVzdAogICAgICAg4pyFIHhmc3Rlc3RzOiBleHQ0
CiAgICAgICDinIUgeGZzdGVzdHM6IHhmcwogICAgICAg4pyFIGx2bSB0aGlucCBzYW5pdHkKICAg
ICAgIOKchSBzdG9yYWdlOiBzb2Z0d2FyZSBSQUlEIHRlc3RpbmcKICAgICAgIPCfmqcg4pyFIElP
TU1VIGJvb3QgdGVzdAogICAgICAg8J+apyDinIUgSVBNSSBkcml2ZXIgdGVzdAogICAgICAg8J+a
pyDinIUgSVBNSXRvb2wgbG9vcCBzdHJlc3MgdGVzdAogICAgICAg8J+apyDinIUgc2VsaW51eC1w
b2xpY3k6IHNlcmdlLXRlc3RzdWl0ZQogICAgICAg8J+apyDinIUgU3RvcmFnZSBibGt0ZXN0cwoK
ICAgIEhvc3QgNDogaHR0cHM6Ly9iZWFrZXIuZW5naW5lZXJpbmcucmVkaGF0LmNvbS9yZWNpcGVz
Lzc2NTEwMzgKICAgICAgIOKchSBCb290IHRlc3QKICAgICAgIOKchSBTdG9yYWdlIFNBTiBkZXZp
Y2Ugc3RyZXNzIC0gbXB0M3NhcyBkcml2ZXIKCiAgVGVzdCBzb3VyY2VzOiBodHRwczovL2dpdGh1
Yi5jb20vQ0tJLXByb2plY3QvdGVzdHMtYmVha2VyCiAgICDwn5KaIFB1bGwgcmVxdWVzdHMgYXJl
IHdlbGNvbWUgZm9yIG5ldyB0ZXN0cyBvciBpbXByb3ZlbWVudHMgdG8gZXhpc3RpbmcgdGVzdHMh
CgpXYWl2ZWQgdGVzdHMKLS0tLS0tLS0tLS0tCklmIHRoZSB0ZXN0IHJ1biBpbmNsdWRlZCB3YWl2
ZWQgdGVzdHMsIHRoZXkgYXJlIG1hcmtlZCB3aXRoIPCfmqcuIFN1Y2ggdGVzdHMgYXJlCmV4ZWN1
dGVkIGJ1dCB0aGVpciByZXN1bHRzIGFyZSBub3QgdGFrZW4gaW50byBhY2NvdW50LiBUZXN0cyBh
cmUgd2FpdmVkIHdoZW4KdGhlaXIgcmVzdWx0cyBhcmUgbm90IHJlbGlhYmxlIGVub3VnaCwgZS5n
LiB3aGVuIHRoZXkncmUganVzdCBpbnRyb2R1Y2VkIG9yIGFyZQpiZWluZyBmaXhlZC4KClRlc3Rp
bmcgdGltZW91dAotLS0tLS0tLS0tLS0tLS0KV2UgYWltIHRvIHByb3ZpZGUgYSByZXBvcnQgd2l0
aGluIHJlYXNvbmFibGUgdGltZWZyYW1lLiBUZXN0cyB0aGF0IGhhdmVuJ3QKZmluaXNoZWQgcnVu
bmluZyBhcmUgbWFya2VkIHdpdGgg4o+xLiBSZXBvcnRzIGZvciBub24tdXBzdHJlYW0ga2VybmVs
cyBoYXZlCmEgQmVha2VyIHJlY2lwZSBsaW5rZWQgdG8gbmV4dCB0byBlYWNoIGhvc3QuCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE436EDC68
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 11:23:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85B663C2707
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 11:23:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 67E8F3C239F
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 04:36:37 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 70EC21A00435
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 04:36:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572838594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Nrj2Wyre5lh2o71ubrbewHVdHwjQqylJ3mnT5D0jZA=;
 b=TxjhYgih/eLfL+XGOMcqTbEcHQuJelcCPBQjLGEV7uZ69e9WMOYeZiieFzvAkvD4FeiBj5
 y3Qh/v7rHehYRcArv3FwcdzmfV5xFkcwcuYBu8GZd0PsRMKxKgEbgh0SaMRuHpQO1OWBpV
 cQ9NfC9pVqhiRnnJn5ql8WTPX9A0okc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-pTxjHCYZMMy1lM4D-Ufzdw-1; Sun, 03 Nov 2019 22:36:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89A81801E5D;
 Mon,  4 Nov 2019 03:36:30 +0000 (UTC)
Received: from [172.54.37.191] (cpt-1013.paas.prod.upshift.rdu2.redhat.com
 [10.0.19.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00B7E6085E;
 Mon,  4 Nov 2019 03:36:24 +0000 (UTC)
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: Linux Stable maillist <stable@vger.kernel.org>
Date: Mon, 04 Nov 2019 03:36:24 -0000
Message-ID: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
X-Gitlab-Pipeline-ID: 262380
X-Gitlab-Url: https://xci32.lab.eng.rdu2.redhat.com
X-Gitlab-Path: /cki-project/cki-pipeline/pipelines/262380
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: pTxjHCYZMMy1lM4D-Ufzdw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 04 Nov 2019 11:22:49 +0100
Subject: [LTP] =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E3?=
 =?utf-8?q?=2E9-rc1-dfe283e=2Ecki_=28stable=29?=
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
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQKICAg
ICAgICAgICAgQ29tbWl0OiBkZmUyODNlOWZkYWMgLSBMaW51eCA1LjMuOS1yYzEKClRoZSByZXN1
bHRzIG9mIHRoZXNlIGF1dG9tYXRlZCB0ZXN0cyBhcmUgcHJvdmlkZWQgYmVsb3cuCgogICAgT3Zl
cmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCiAgICAgICAgICAgICBNZXJn
ZTogT0sKICAgICAgICAgICBDb21waWxlOiBPSwogICAgICAgICAgICAgVGVzdHM6IEZBSUxFRAoK
QWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9ncyBhcmUgYXZhaWxhYmxl
IGZvciBkb3dubG9hZCBoZXJlOgoKICBodHRwczovL2FydGlmYWN0cy5ja2ktcHJvamVjdC5vcmcv
cGlwZWxpbmVzLzI2MjM4MAoKT25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKCiAgICB4
ODZfNjQ6CiAgICAg4p2MIExUUCBsaXRlCgpXZSBob3BlIHRoYXQgdGhlc2UgbG9ncyBjYW4gaGVs
cCB5b3UgZmluZCB0aGUgcHJvYmxlbSBxdWlja2x5LiBGb3IgdGhlIGZ1bGwKZGV0YWlsIG9uIG91
ciB0ZXN0aW5nIHByb2NlZHVyZXMsIHBsZWFzZSBzY3JvbGwgdG8gdGhlIGJvdHRvbSBvZiB0aGlz
IG1lc3NhZ2UuCgpQbGVhc2UgcmVwbHkgdG8gdGhpcyBlbWFpbCBpZiB5b3UgaGF2ZSBhbnkgcXVl
c3Rpb25zIGFib3V0IHRoZSB0ZXN0cyB0aGF0IHdlCnJhbiBvciBpZiB5b3UgaGF2ZSBhbnkgc3Vn
Z2VzdGlvbnMgb24gaG93IHRvIG1ha2UgZnV0dXJlIHRlc3RzIG1vcmUgZWZmZWN0aXZlLgoKICAg
ICAgICAsLS4gICAsLS4KICAgICAgICggQyApICggSyApICBDb250aW51b3VzCiAgICAgICAgYC0n
LC0uYC0nICAgS2VybmVsCiAgICAgICAgICAoIEkgKSAgICAgSW50ZWdyYXRpb24KICAgICAgICAg
ICBgLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCgpDb21waWxlIHRlc3RpbmcKLS0tLS0tLS0tLS0t
LS0tCgpXZSBjb21waWxlZCB0aGUga2VybmVsIGZvciAzIGFyY2hpdGVjdHVyZXM6CgogICAgYWFy
Y2g2NDoKICAgICAgbWFrZSBvcHRpb25zOiAtajMwIElOU1RBTExfTU9EX1NUUklQPTEgdGFyZ3ot
cGtnCgogICAgcHBjNjRsZToKICAgICAgbWFrZSBvcHRpb25zOiAtajMwIElOU1RBTExfTU9EX1NU
UklQPTEgdGFyZ3otcGtnCgogICAgeDg2XzY0OgogICAgICBtYWtlIG9wdGlvbnM6IC1qMzAgSU5T
VEFMTF9NT0RfU1RSSVA9MSB0YXJnei1wa2cKCgpIYXJkd2FyZSB0ZXN0aW5nCi0tLS0tLS0tLS0t
LS0tLS0KV2UgYm9vdGVkIGVhY2gga2VybmVsIGFuZCByYW4gdGhlIGZvbGxvd2luZyB0ZXN0czoK
CiAgYWFyY2g2NDoKICAgIEhvc3QgMToKICAgICAgIOKchSBCb290IHRlc3QKICAgICAgIOKchSBQ
b2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRlc3QgKGFzIHJvb3QpCiAgICAgICDinIUgUG9kbWFu
IHN5c3RlbSBpbnRlZ3JhdGlvbiB0ZXN0IChhcyB1c2VyKQogICAgICAg4pyFIExUUCBsaXRlCiAg
ICAgICDinIUgTG9vcGRldiBTYW5pdHkKICAgICAgIOKchSBqdm0gdGVzdCBzdWl0ZQogICAgICAg
4pyFIE1lbW9yeSBmdW5jdGlvbjogbWVtZmRfY3JlYXRlCiAgICAgICDinIUgTWVtb3J5IGZ1bmN0
aW9uOiBrYXNscgogICAgICAg4pyFIEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVzdCBVdGlsaXR5
KQogICAgICAg4pyFIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGUKICAgICAgIOKchSBFdGhlcm5l
dCBkcml2ZXJzIHNhbml0eQogICAgICAg4pyFIE5ldHdvcmtpbmcgTUFDc2VjOiBzYW5pdHkKICAg
ICAgIOKchSBOZXR3b3JraW5nIHNvY2tldDogZnV6egogICAgICAg4pyFIE5ldHdvcmtpbmcgc2N0
cC1hdXRoOiBzb2Nrb3B0cyB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZzogaWdtcCBjb25mb3Jt
YW5jZSB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZyByb3V0ZTogcG10dQogICAgICAg4pyFIE5l
dHdvcmtpbmcgVENQOiBrZWVwYWxpdmUgdGVzdAogICAgICAg4pyFIE5ldHdvcmtpbmcgVURQOiBz
b2NrZXQKICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ2VuZXZlIGJhc2ljIHRlc3QKICAg
ICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ3JlIGJhc2ljCiAgICAgICDinIUgTmV0d29ya2lu
ZyB0dW5uZWw6IHZ4bGFuIGJhc2ljCiAgICAgICDinIUgYXVkaXQ6IGF1ZGl0IHRlc3RzdWl0ZSB0
ZXN0CiAgICAgICDinIUgaHR0cGQ6IG1vZF9zc2wgc21va2Ugc2FuaXR5CiAgICAgICDinIUgaW90
b3A6IHNhbml0eQogICAgICAg4pyFIHR1bmVkOiB0dW5lLXByb2Nlc3Nlcy10aHJvdWdoLXBlcmYK
ICAgICAgIOKchSBBTFNBIFBDTSBsb29wYmFjayB0ZXN0CiAgICAgICDinIUgQUxTQSBDb250cm9s
IChtaXhlcikgVXNlcnNwYWNlIEVsZW1lbnQgdGVzdAogICAgICAg4pyFIFVzZXggLSB2ZXJzaW9u
IDEuOS0yOQogICAgICAg4pyFIHN0b3JhZ2U6IFNDU0kgVlBECiAgICAgICDinIUgdHJhY2U6IGZ0
cmFjZS90cmFjZXIKICAgICAgIPCfmqcg4pyFIENJRlMgQ29ubmVjdGF0aG9uCiAgICAgICDwn5qn
IOKchSBQT1NJWCBwamQtZnN0ZXN0IHN1aXRlcwogICAgICAg8J+apyDinIUgTmV0d29ya2luZyBi
cmlkZ2U6IHNhbml0eQogICAgICAg8J+apyDinIUgTmV0d29ya2luZyByb3V0ZV9mdW5jOiBsb2Nh
bAogICAgICAg4pyFIE5ldHdvcmtpbmcgcm91dGVfZnVuYzogZm9yd2FyZAogICAgICAg8J+apyDi
nIUgTDJUUCBiYXNpYyB0ZXN0CiAgICAgICDwn5qnIOKchSBOZXR3b3JraW5nIHZuaWM6IGlwdmxh
bi9iYXNpYwogICAgICAg8J+apyDinIUgc3RvcmFnZTogZG0vY29tbW9uCiAgICAgICDwn5qnIOKc
hSBOZXR3b3JraW5nIGlwc2VjOiBiYXNpYyBuZXRucyB0cmFuc3BvcnQKICAgICAgIPCfmqcg4pyF
IE5ldHdvcmtpbmcgaXBzZWM6IGJhc2ljIG5ldG5zIHR1bm5lbAoKICAgIEhvc3QgMjoKICAgICAg
IOKchSBCb290IHRlc3QKICAgICAgIOKchSB4ZnN0ZXN0czogZXh0NAogICAgICAg4pyFIHhmc3Rl
c3RzOiB4ZnMKICAgICAgIOKchSBzZWxpbnV4LXBvbGljeTogc2VyZ2UtdGVzdHN1aXRlCiAgICAg
ICDinIUgbHZtIHRoaW5wIHNhbml0eQogICAgICAg4pyFIHN0b3JhZ2U6IHNvZnR3YXJlIFJBSUQg
dGVzdGluZwogICAgICAg8J+apyDinIUgU3RvcmFnZSBibGt0ZXN0cwoKICBwcGM2NGxlOgogICAg
SG9zdCAxOgogICAgICAg4pyFIEJvb3QgdGVzdAogICAgICAg4pyFIFBvZG1hbiBzeXN0ZW0gaW50
ZWdyYXRpb24gdGVzdCAoYXMgcm9vdCkKICAgICAgIOKchSBQb2RtYW4gc3lzdGVtIGludGVncmF0
aW9uIHRlc3QgKGFzIHVzZXIpCiAgICAgICDinIUgTFRQIGxpdGUKICAgICAgIOKchSBMb29wZGV2
IFNhbml0eQogICAgICAg4pyFIGp2bSB0ZXN0IHN1aXRlCiAgICAgICDinIUgTWVtb3J5IGZ1bmN0
aW9uOiBtZW1mZF9jcmVhdGUKICAgICAgIOKchSBNZW1vcnkgZnVuY3Rpb246IGthc2xyCiAgICAg
ICDinIUgQU1UVSAoQWJzdHJhY3QgTWFjaGluZSBUZXN0IFV0aWxpdHkpCiAgICAgICDinIUgTFRQ
OiBvcGVucG9zaXggdGVzdCBzdWl0ZQogICAgICAg4pyFIEV0aGVybmV0IGRyaXZlcnMgc2FuaXR5
CiAgICAgICDinIUgTmV0d29ya2luZyBNQUNzZWM6IHNhbml0eQogICAgICAg4pyFIE5ldHdvcmtp
bmcgc29ja2V0OiBmdXp6CiAgICAgICDinIUgTmV0d29ya2luZyBzY3RwLWF1dGg6IHNvY2tvcHRz
IHRlc3QKICAgICAgIOKchSBOZXR3b3JraW5nIHJvdXRlOiBwbXR1CiAgICAgICDinIUgTmV0d29y
a2luZyBUQ1A6IGtlZXBhbGl2ZSB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZyBVRFA6IHNvY2tl
dAogICAgICAg4pyFIE5ldHdvcmtpbmcgdHVubmVsOiBnZW5ldmUgYmFzaWMgdGVzdAogICAgICAg
4pyFIE5ldHdvcmtpbmcgdHVubmVsOiBncmUgYmFzaWMKICAgICAgIOKchSBOZXR3b3JraW5nIHR1
bm5lbDogdnhsYW4gYmFzaWMKICAgICAgIOKchSBhdWRpdDogYXVkaXQgdGVzdHN1aXRlIHRlc3QK
ICAgICAgIOKchSBodHRwZDogbW9kX3NzbCBzbW9rZSBzYW5pdHkKICAgICAgIOKchSBpb3RvcDog
c2FuaXR5CiAgICAgICDinIUgdHVuZWQ6IHR1bmUtcHJvY2Vzc2VzLXRocm91Z2gtcGVyZgogICAg
ICAg4pyFIEFMU0EgUENNIGxvb3BiYWNrIHRlc3QKICAgICAgIOKchSBBTFNBIENvbnRyb2wgKG1p
eGVyKSBVc2Vyc3BhY2UgRWxlbWVudCB0ZXN0CiAgICAgICDinIUgVXNleCAtIHZlcnNpb24gMS45
LTI5CiAgICAgICDinIUgdHJhY2U6IGZ0cmFjZS90cmFjZXIKICAgICAgIPCfmqcg4pyFIENJRlMg
Q29ubmVjdGF0aG9uCiAgICAgICDwn5qnIOKchSBQT1NJWCBwamQtZnN0ZXN0IHN1aXRlcwogICAg
ICAg8J+apyDinIUgTmV0d29ya2luZyBicmlkZ2U6IHNhbml0eQogICAgICAg8J+apyDinIUgTmV0
d29ya2luZyByb3V0ZV9mdW5jOiBsb2NhbAogICAgICAg4pyFIE5ldHdvcmtpbmcgcm91dGVfZnVu
YzogZm9yd2FyZAogICAgICAg8J+apyDinIUgTDJUUCBiYXNpYyB0ZXN0CiAgICAgICDwn5qnIOKc
hSBOZXR3b3JraW5nIGlwc2VjOiBiYXNpYyBuZXRucyB0dW5uZWwKICAgICAgIPCfmqcg4pyFIE5l
dHdvcmtpbmcgdm5pYzogaXB2bGFuL2Jhc2ljCiAgICAgICDwn5qnIOKchSBzdG9yYWdlOiBkbS9j
b21tb24KCiAgICBIb3N0IDI6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDinIUgeGZzdGVz
dHM6IGV4dDQKICAgICAgIOKchSB4ZnN0ZXN0czogeGZzCiAgICAgICDinIUgc2VsaW51eC1wb2xp
Y3k6IHNlcmdlLXRlc3RzdWl0ZQogICAgICAg4pyFIGx2bSB0aGlucCBzYW5pdHkKICAgICAgIOKc
hSBzdG9yYWdlOiBzb2Z0d2FyZSBSQUlEIHRlc3RpbmcKICAgICAgIPCfmqcg4pyFIFN0b3JhZ2Ug
YmxrdGVzdHMKCiAgeDg2XzY0OgogICAgSG9zdCAxOgogICAgICAg4pyFIEJvb3QgdGVzdAogICAg
ICAg8J+apyDinIUgSVBNSSBkcml2ZXIgdGVzdAogICAgICAg8J+apyDinIUgSVBNSXRvb2wgbG9v
cCBzdHJlc3MgdGVzdAoKICAgIEhvc3QgMjoKICAgICAgIOKchSBCb290IHRlc3QKICAgICAgIOKc
hSBQb2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRlc3QgKGFzIHJvb3QpCiAgICAgICDinIUgUG9k
bWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0ZXN0IChhcyB1c2VyKQogICAgICAg4p2MIExUUCBsaXRl
CiAgICAgICDinIUgTG9vcGRldiBTYW5pdHkKICAgICAgIOKchSBqdm0gdGVzdCBzdWl0ZQogICAg
ICAg4pyFIE1lbW9yeSBmdW5jdGlvbjogbWVtZmRfY3JlYXRlCiAgICAgICDinIUgTWVtb3J5IGZ1
bmN0aW9uOiBrYXNscgogICAgICAg4pyFIEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVzdCBVdGls
aXR5KQogICAgICAg4pyFIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGUKICAgICAgIOKchSBFdGhl
cm5ldCBkcml2ZXJzIHNhbml0eQogICAgICAg4pyFIE5ldHdvcmtpbmcgTUFDc2VjOiBzYW5pdHkK
ICAgICAgIOKchSBOZXR3b3JraW5nIHNvY2tldDogZnV6egogICAgICAg4pyFIE5ldHdvcmtpbmcg
c2N0cC1hdXRoOiBzb2Nrb3B0cyB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZzogaWdtcCBjb25m
b3JtYW5jZSB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZyByb3V0ZTogcG10dQogICAgICAg4pyF
IE5ldHdvcmtpbmcgVENQOiBrZWVwYWxpdmUgdGVzdAogICAgICAg4pyFIE5ldHdvcmtpbmcgVURQ
OiBzb2NrZXQKICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ2VuZXZlIGJhc2ljIHRlc3QK
ICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ3JlIGJhc2ljCiAgICAgICDinIUgTmV0d29y
a2luZyB0dW5uZWw6IHZ4bGFuIGJhc2ljCiAgICAgICDinIUgYXVkaXQ6IGF1ZGl0IHRlc3RzdWl0
ZSB0ZXN0CiAgICAgICDinIUgaHR0cGQ6IG1vZF9zc2wgc21va2Ugc2FuaXR5CiAgICAgICDinIUg
aW90b3A6IHNhbml0eQogICAgICAg4pyFIHR1bmVkOiB0dW5lLXByb2Nlc3Nlcy10aHJvdWdoLXBl
cmYKICAgICAgIOKchSBwY2l1dGlsczogc2FuaXR5IHNtb2tlIHRlc3QKICAgICAgIOKchSBBTFNB
IFBDTSBsb29wYmFjayB0ZXN0CiAgICAgICDinIUgQUxTQSBDb250cm9sIChtaXhlcikgVXNlcnNw
YWNlIEVsZW1lbnQgdGVzdAogICAgICAg4pyFIFVzZXggLSB2ZXJzaW9uIDEuOS0yOQogICAgICAg
4pyFIHN0b3JhZ2U6IFNDU0kgVlBECiAgICAgICDinIUgc3RyZXNzOiBzdHJlc3MtbmcKICAgICAg
IOKchSB0cmFjZTogZnRyYWNlL3RyYWNlcgogICAgICAg8J+apyDinIUgQ0lGUyBDb25uZWN0YXRo
b24KICAgICAgIPCfmqcg4pyFIFBPU0lYIHBqZC1mc3Rlc3Qgc3VpdGVzCiAgICAgICDwn5qnIOKc
hSBOZXR3b3JraW5nIGJyaWRnZTogc2FuaXR5CiAgICAgICDwn5qnIOKchSBOZXR3b3JraW5nIHJv
dXRlX2Z1bmM6IGxvY2FsCiAgICAgICDinIUgTmV0d29ya2luZyByb3V0ZV9mdW5jOiBmb3J3YXJk
CiAgICAgICDwn5qnIOKchSBMMlRQIGJhc2ljIHRlc3QKICAgICAgIPCfmqcg4pyFIE5ldHdvcmtp
bmcgdm5pYzogaXB2bGFuL2Jhc2ljCiAgICAgICDwn5qnIOKchSBzdG9yYWdlOiBkbS9jb21tb24K
ICAgICAgIPCfmqcg4pyFIE5ldHdvcmtpbmcgaXBzZWM6IGJhc2ljIG5ldG5zIHRyYW5zcG9ydAog
ICAgICAg8J+apyDinIUgTmV0d29ya2luZyBpcHNlYzogYmFzaWMgbmV0bnMgdHVubmVsCgogICAg
SG9zdCAzOgogICAgICAg4pyFIEJvb3QgdGVzdAogICAgICAg4pyFIHhmc3Rlc3RzOiBleHQ0CiAg
ICAgICDinIUgeGZzdGVzdHM6IHhmcwogICAgICAg4pyFIHNlbGludXgtcG9saWN5OiBzZXJnZS10
ZXN0c3VpdGUKICAgICAgIOKchSBsdm0gdGhpbnAgc2FuaXR5CiAgICAgICDinIUgc3RvcmFnZTog
c29mdHdhcmUgUkFJRCB0ZXN0aW5nCiAgICAgICDwn5qnIOKchSBJT01NVSBib290IHRlc3QKICAg
ICAgIPCfmqcg4pyFIFN0b3JhZ2UgYmxrdGVzdHMKCiAgVGVzdCBzb3VyY2VzOiBodHRwczovL2dp
dGh1Yi5jb20vQ0tJLXByb2plY3QvdGVzdHMtYmVha2VyCiAgICDwn5KaIFB1bGwgcmVxdWVzdHMg
YXJlIHdlbGNvbWUgZm9yIG5ldyB0ZXN0cyBvciBpbXByb3ZlbWVudHMgdG8gZXhpc3RpbmcgdGVz
dHMhCgpXYWl2ZWQgdGVzdHMKLS0tLS0tLS0tLS0tCklmIHRoZSB0ZXN0IHJ1biBpbmNsdWRlZCB3
YWl2ZWQgdGVzdHMsIHRoZXkgYXJlIG1hcmtlZCB3aXRoIPCfmqcuIFN1Y2ggdGVzdHMgYXJlCmV4
ZWN1dGVkIGJ1dCB0aGVpciByZXN1bHRzIGFyZSBub3QgdGFrZW4gaW50byBhY2NvdW50LiBUZXN0
cyBhcmUgd2FpdmVkIHdoZW4KdGhlaXIgcmVzdWx0cyBhcmUgbm90IHJlbGlhYmxlIGVub3VnaCwg
ZS5nLiB3aGVuIHRoZXkncmUganVzdCBpbnRyb2R1Y2VkIG9yIGFyZQpiZWluZyBmaXhlZC4KClRl
c3RpbmcgdGltZW91dAotLS0tLS0tLS0tLS0tLS0KV2UgYWltIHRvIHByb3ZpZGUgYSByZXBvcnQg
d2l0aGluIHJlYXNvbmFibGUgdGltZWZyYW1lLiBUZXN0cyB0aGF0IGhhdmVuJ3QKZmluaXNoZWQg
cnVubmluZyBhcmUgbWFya2VkIHdpdGgg4o+xLiBSZXBvcnRzIGZvciBub24tdXBzdHJlYW0ga2Vy
bmVscyBoYXZlCmEgQmVha2VyIHJlY2lwZSBsaW5rZWQgdG8gbmV4dCB0byBlYWNoIGhvc3QuCgoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=

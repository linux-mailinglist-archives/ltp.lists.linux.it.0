Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B818078C
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 20:00:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97E4A3C6020
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 20:00:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E2B6E3C5FF7
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 20:00:42 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 6589C14016A1
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 20:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583866839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vF6efEg7EAkHVtdNoe0Lfq9o/KP2gBr5d3RBoznAhfE=;
 b=YtgFACOv6MlTlOxpfbsc5rUs7eli6VbhKZS7DNYMiYuP8MuEgqLjM9Sx9kYXHo9Fj+wNMq
 YdaiNzaMdNqur0Y79R+8vUjhk7ksKYRMmz+EnHG5/DFD8atrt6IZUaW2v5ir1g7P1W80Eg
 odEYMD3Mz7cKUW2ns1fZuZM2OuAeHVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-dyalaNgSN8OJg6GwFYz9tw-1; Tue, 10 Mar 2020 15:00:34 -0400
X-MC-Unique: dyalaNgSN8OJg6GwFYz9tw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA84B108442F;
 Tue, 10 Mar 2020 19:00:32 +0000 (UTC)
Received: from [172.54.102.53] (cpt-1044.paas.prod.upshift.rdu2.redhat.com
 [10.0.19.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E44C59008F;
 Tue, 10 Mar 2020 19:00:23 +0000 (UTC)
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: Linux Stable maillist <stable@vger.kernel.org>
Date: Tue, 10 Mar 2020 19:00:23 -0000
Message-ID: <cki.9B00F0B1A4.7WKT4AT3X9@redhat.com>
X-Gitlab-Pipeline-ID: 481736
X-Gitlab-Url: https://xci32.lab.eng.rdu2.redhat.com
X-Gitlab-Path: /cki-project/cki-pipeline/pipelines/481736
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E5?=
 =?utf-8?q?=2E8-cdb9b75=2Ecki_=28stable-queue=29?=
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
Cc: Milos Malik <mmalik@redhat.com>, Zorro Lang <zlong@redhat.com>,
 Memory Management <mm-qe@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 David Jez <djez@redhat.com>, Ondrej Moris <omoris@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CkhlbGxvLAoKV2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0
aGlzIGtlcm5lbCB0cmVlOgoKICAgICAgIEtlcm5lbCByZXBvOiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdAog
ICAgICAgICAgICBDb21taXQ6IGNkYjliNzU1NTliNSAtIGVmaTogUkVBRF9PTkNFIHJuZyBzZWVk
IHNpemUgYmVmb3JlIG11bm1hcAoKVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3Rz
IGFyZSBwcm92aWRlZCBiZWxvdy4KCiAgICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0
YWlscyBiZWxvdykKICAgICAgICAgICAgIE1lcmdlOiBPSwogICAgICAgICAgIENvbXBpbGU6IE9L
CiAgICAgICAgICAgICBUZXN0czogRkFJTEVECgpBbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcg
ZmlsZXMsIGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkIGhlcmU6CgogIGh0dHBz
Oi8vY2tpLWFydGlmYWN0cy5zMy51cy1lYXN0LTIuYW1hem9uYXdzLmNvbS9pbmRleC5odG1sP3By
ZWZpeD1kYXRhd2FyZWhvdXNlLzIwMjAvMDMvMTAvNDgxNzM2CgpPbmUgb3IgbW9yZSBrZXJuZWwg
dGVzdHMgZmFpbGVkOgoKICAgIHMzOTB4OgogICAgIOKdjCBMVFAKICAgICDinYwgYXVkaXQ6IGF1
ZGl0IHRlc3RzdWl0ZSB0ZXN0CgogICAgcHBjNjRsZToKICAgICDinYwgc2VsaW51eC1wb2xpY3k6
IHNlcmdlLXRlc3RzdWl0ZQogICAgIOKdjCBhdWRpdDogYXVkaXQgdGVzdHN1aXRlIHRlc3QKCiAg
ICBhYXJjaDY0OgogICAgIOKdjCBhdWRpdDogYXVkaXQgdGVzdHN1aXRlIHRlc3QKCiAgICB4ODZf
NjQ6CiAgICAg4p2MIExUUAogICAgIOKdjCBhdWRpdDogYXVkaXQgdGVzdHN1aXRlIHRlc3QKCldl
IGhvcGUgdGhhdCB0aGVzZSBsb2dzIGNhbiBoZWxwIHlvdSBmaW5kIHRoZSBwcm9ibGVtIHF1aWNr
bHkuIEZvciB0aGUgZnVsbApkZXRhaWwgb24gb3VyIHRlc3RpbmcgcHJvY2VkdXJlcywgcGxlYXNl
IHNjcm9sbCB0byB0aGUgYm90dG9tIG9mIHRoaXMgbWVzc2FnZS4KClBsZWFzZSByZXBseSB0byB0
aGlzIGVtYWlsIGlmIHlvdSBoYXZlIGFueSBxdWVzdGlvbnMgYWJvdXQgdGhlIHRlc3RzIHRoYXQg
d2UKcmFuIG9yIGlmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gbWFrZSBmdXR1
cmUgdGVzdHMgbW9yZSBlZmZlY3RpdmUuCgogICAgICAgICwtLiAgICwtLgogICAgICAgKCBDICkg
KCBLICkgIENvbnRpbnVvdXMKICAgICAgICBgLScsLS5gLScgICBLZXJuZWwKICAgICAgICAgICgg
SSApICAgICBJbnRlZ3JhdGlvbgogICAgICAgICAgIGAtJwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
CkNvbXBpbGUgdGVzdGluZwotLS0tLS0tLS0tLS0tLS0KCldlIGNvbXBpbGVkIHRoZSBrZXJuZWwg
Zm9yIDQgYXJjaGl0ZWN0dXJlczoKCiAgICBhYXJjaDY0OgogICAgICBtYWtlIG9wdGlvbnM6IC1q
MzAgSU5TVEFMTF9NT0RfU1RSSVA9MSB0YXJnei1wa2cKCiAgICBwcGM2NGxlOgogICAgICBtYWtl
IG9wdGlvbnM6IC1qMzAgSU5TVEFMTF9NT0RfU1RSSVA9MSB0YXJnei1wa2cKCiAgICBzMzkweDoK
ICAgICAgbWFrZSBvcHRpb25zOiAtajMwIElOU1RBTExfTU9EX1NUUklQPTEgdGFyZ3otcGtnCgog
ICAgeDg2XzY0OgogICAgICBtYWtlIG9wdGlvbnM6IC1qMzAgSU5TVEFMTF9NT0RfU1RSSVA9MSB0
YXJnei1wa2cKCgpIYXJkd2FyZSB0ZXN0aW5nCi0tLS0tLS0tLS0tLS0tLS0KV2UgYm9vdGVkIGVh
Y2gga2VybmVsIGFuZCByYW4gdGhlIGZvbGxvd2luZyB0ZXN0czoKCiAgYWFyY2g2NDoKICAgIEhv
c3QgMToKICAgICAgIOKchSBCb290IHRlc3QKICAgICAgIOKchSB4ZnN0ZXN0cyAtIGV4dDQKICAg
ICAgIOKchSB4ZnN0ZXN0cyAtIHhmcwogICAgICAg4pyFIHNlbGludXgtcG9saWN5OiBzZXJnZS10
ZXN0c3VpdGUKICAgICAgIOKchSBsdm0gdGhpbnAgc2FuaXR5CiAgICAgICDinIUgc3RvcmFnZTog
c29mdHdhcmUgUkFJRCB0ZXN0aW5nCiAgICAgICDwn5qnIOKchSBTdG9yYWdlIGJsa3Rlc3RzCgog
ICAgSG9zdCAyOgogICAgICAg4pyFIEJvb3QgdGVzdAogICAgICAg4pyFIFBvZG1hbiBzeXN0ZW0g
aW50ZWdyYXRpb24gdGVzdCAtIGFzIHJvb3QKICAgICAgIOKchSBQb2RtYW4gc3lzdGVtIGludGVn
cmF0aW9uIHRlc3QgLSBhcyB1c2VyCiAgICAgICDinIUgTFRQCiAgICAgICDinIUgTG9vcGRldiBT
YW5pdHkKICAgICAgIOKchSBNZW1vcnkgZnVuY3Rpb246IG1lbWZkX2NyZWF0ZQogICAgICAg4pyF
IEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVzdCBVdGlsaXR5KQogICAgICAg4pyFIE5ldHdvcmtp
bmcgYnJpZGdlOiBzYW5pdHkKICAgICAgIOKchSBFdGhlcm5ldCBkcml2ZXJzIHNhbml0eQogICAg
ICAg4pyFIE5ldHdvcmtpbmcgTUFDc2VjOiBzYW5pdHkKICAgICAgIOKchSBOZXR3b3JraW5nIHNv
Y2tldDogZnV6egogICAgICAg4pyFIE5ldHdvcmtpbmcgc2N0cC1hdXRoOiBzb2Nrb3B0cyB0ZXN0
CiAgICAgICDinIUgTmV0d29ya2luZzogaWdtcCBjb25mb3JtYW5jZSB0ZXN0CiAgICAgICDinIUg
TmV0d29ya2luZyByb3V0ZTogcG10dQogICAgICAg4pyFIE5ldHdvcmtpbmcgcm91dGVfZnVuYyAt
IGxvY2FsCiAgICAgICDinIUgTmV0d29ya2luZyByb3V0ZV9mdW5jIC0gZm9yd2FyZAogICAgICAg
4pyFIE5ldHdvcmtpbmcgVENQOiBrZWVwYWxpdmUgdGVzdAogICAgICAg4pyFIE5ldHdvcmtpbmcg
VURQOiBzb2NrZXQKICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ2VuZXZlIGJhc2ljIHRl
c3QKICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ3JlIGJhc2ljCiAgICAgICDinIUgTDJU
UCBiYXNpYyB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZyB0dW5uZWw6IHZ4bGFuIGJhc2ljCiAg
ICAgICDinIUgTmV0d29ya2luZyBpcHNlYzogYmFzaWMgbmV0bnMgLSB0cmFuc3BvcnQKICAgICAg
IOKchSBOZXR3b3JraW5nIGlwc2VjOiBiYXNpYyBuZXRucyAtIHR1bm5lbAogICAgICAg4p2MIGF1
ZGl0OiBhdWRpdCB0ZXN0c3VpdGUgdGVzdAogICAgICAg4pyFIGh0dHBkOiBtb2Rfc3NsIHNtb2tl
IHNhbml0eQogICAgICAg4pyFIHR1bmVkOiB0dW5lLXByb2Nlc3Nlcy10aHJvdWdoLXBlcmYKICAg
ICAgIOKchSBBTFNBIFBDTSBsb29wYmFjayB0ZXN0CiAgICAgICDinIUgQUxTQSBDb250cm9sICht
aXhlcikgVXNlcnNwYWNlIEVsZW1lbnQgdGVzdAogICAgICAg4pyFIHN0b3JhZ2U6IFNDU0kgVlBE
CiAgICAgICDinIUgdHJhY2U6IGZ0cmFjZS90cmFjZXIKICAgICAgIPCfmqcg4pyFIENJRlMgQ29u
bmVjdGF0aG9uCiAgICAgICDwn5qnIOKchSBQT1NJWCBwamQtZnN0ZXN0IHN1aXRlcwogICAgICAg
8J+apyDinIUganZtIC0gRGFDYXBvIEJlbmNobWFyayBTdWl0ZQogICAgICAg8J+apyDinIUganZt
IC0gamNzdHJlc3MgdGVzdHMKICAgICAgIPCfmqcg4pyFIE1lbW9yeSBmdW5jdGlvbjoga2FzbHIK
ICAgICAgIPCfmqcg4pyFIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGUKICAgICAgIPCfmqcg4pyF
IE5ldHdvcmtpbmcgdm5pYzogaXB2bGFuL2Jhc2ljCiAgICAgICDwn5qnIOKchSBpb3RvcDogc2Fu
aXR5CiAgICAgICDwn5qnIOKchSBVc2V4IC0gdmVyc2lvbiAxLjktMjkKICAgICAgIPCfmqcg4pyF
IHN0b3JhZ2U6IGRtL2NvbW1vbgoKICBwcGM2NGxlOgogICAgSG9zdCAxOgogICAgICAg4pyFIEJv
b3QgdGVzdAogICAgICAg4pyFIHhmc3Rlc3RzIC0gZXh0NAogICAgICAg4pyFIHhmc3Rlc3RzIC0g
eGZzCiAgICAgICDinYwgc2VsaW51eC1wb2xpY3k6IHNlcmdlLXRlc3RzdWl0ZQogICAgICAg4pyF
IGx2bSB0aGlucCBzYW5pdHkKICAgICAgIOKchSBzdG9yYWdlOiBzb2Z0d2FyZSBSQUlEIHRlc3Rp
bmcKICAgICAgIPCfmqcg4pyFIElQTUkgZHJpdmVyIHRlc3QKICAgICAgIPCfmqcg4pyFIElQTUl0
b29sIGxvb3Agc3RyZXNzIHRlc3QKICAgICAgIPCfmqcg4pyFIFN0b3JhZ2UgYmxrdGVzdHMKCiAg
ICBIb3N0IDI6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDinIUgUG9kbWFuIHN5c3RlbSBp
bnRlZ3JhdGlvbiB0ZXN0IC0gYXMgcm9vdAogICAgICAg4pyFIFBvZG1hbiBzeXN0ZW0gaW50ZWdy
YXRpb24gdGVzdCAtIGFzIHVzZXIKICAgICAgIOKchSBMVFAKICAgICAgIOKchSBMb29wZGV2IFNh
bml0eQogICAgICAg4pyFIE1lbW9yeSBmdW5jdGlvbjogbWVtZmRfY3JlYXRlCiAgICAgICDinIUg
QU1UVSAoQWJzdHJhY3QgTWFjaGluZSBUZXN0IFV0aWxpdHkpCiAgICAgICDinIUgTmV0d29ya2lu
ZyBicmlkZ2U6IHNhbml0eQogICAgICAg4pyFIEV0aGVybmV0IGRyaXZlcnMgc2FuaXR5CiAgICAg
ICDinIUgTmV0d29ya2luZyBNQUNzZWM6IHNhbml0eQogICAgICAg4pyFIE5ldHdvcmtpbmcgc29j
a2V0OiBmdXp6CiAgICAgICDinIUgTmV0d29ya2luZyBzY3RwLWF1dGg6IHNvY2tvcHRzIHRlc3QK
ICAgICAgIOKchSBOZXR3b3JraW5nIHJvdXRlOiBwbXR1CiAgICAgICDinIUgTmV0d29ya2luZyBy
b3V0ZV9mdW5jIC0gbG9jYWwKICAgICAgIOKchSBOZXR3b3JraW5nIHJvdXRlX2Z1bmMgLSBmb3J3
YXJkCiAgICAgICDinIUgTmV0d29ya2luZyBUQ1A6IGtlZXBhbGl2ZSB0ZXN0CiAgICAgICDinIUg
TmV0d29ya2luZyBVRFA6IHNvY2tldAogICAgICAg4pyFIE5ldHdvcmtpbmcgdHVubmVsOiBnZW5l
dmUgYmFzaWMgdGVzdAogICAgICAg4pyFIE5ldHdvcmtpbmcgdHVubmVsOiBncmUgYmFzaWMKICAg
ICAgIOKchSBMMlRQIGJhc2ljIHRlc3QKICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogdnhs
YW4gYmFzaWMKICAgICAgIOKchSBOZXR3b3JraW5nIGlwc2VjOiBiYXNpYyBuZXRucyAtIHR1bm5l
bAogICAgICAg4p2MIGF1ZGl0OiBhdWRpdCB0ZXN0c3VpdGUgdGVzdAogICAgICAg4pyFIGh0dHBk
OiBtb2Rfc3NsIHNtb2tlIHNhbml0eQogICAgICAg4pyFIHR1bmVkOiB0dW5lLXByb2Nlc3Nlcy10
aHJvdWdoLXBlcmYKICAgICAgIOKchSBBTFNBIFBDTSBsb29wYmFjayB0ZXN0CiAgICAgICDinIUg
QUxTQSBDb250cm9sIChtaXhlcikgVXNlcnNwYWNlIEVsZW1lbnQgdGVzdAogICAgICAg4pyFIHRy
YWNlOiBmdHJhY2UvdHJhY2VyCiAgICAgICDwn5qnIOKchSBDSUZTIENvbm5lY3RhdGhvbgogICAg
ICAg8J+apyDinIUgUE9TSVggcGpkLWZzdGVzdCBzdWl0ZXMKICAgICAgIPCfmqcg4pyFIGp2bSAt
IERhQ2FwbyBCZW5jaG1hcmsgU3VpdGUKICAgICAgIPCfmqcg4pyFIGp2bSAtIGpjc3RyZXNzIHRl
c3RzCiAgICAgICDwn5qnIOKchSBNZW1vcnkgZnVuY3Rpb246IGthc2xyCiAgICAgICDwn5qnIOKc
hSBMVFA6IG9wZW5wb3NpeCB0ZXN0IHN1aXRlCiAgICAgICDwn5qnIOKchSBOZXR3b3JraW5nIHZu
aWM6IGlwdmxhbi9iYXNpYwogICAgICAg8J+apyDinIUgaW90b3A6IHNhbml0eQogICAgICAg8J+a
pyDinIUgVXNleCAtIHZlcnNpb24gMS45LTI5CiAgICAgICDwn5qnIOKchSBzdG9yYWdlOiBkbS9j
b21tb24KCiAgczM5MHg6CiAgICBIb3N0IDE6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDi
nIUgUG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0ZXN0IC0gYXMgcm9vdAogICAgICAg4pyFIFBv
ZG1hbiBzeXN0ZW0gaW50ZWdyYXRpb24gdGVzdCAtIGFzIHVzZXIKICAgICAgIOKdjCBMVFAKICAg
ICAgIOKchSBMb29wZGV2IFNhbml0eQogICAgICAg4pyFIE1lbW9yeSBmdW5jdGlvbjogbWVtZmRf
Y3JlYXRlCiAgICAgICDinIUgTmV0d29ya2luZyBicmlkZ2U6IHNhbml0eQogICAgICAg4pyFIEV0
aGVybmV0IGRyaXZlcnMgc2FuaXR5CiAgICAgICDinIUgTmV0d29ya2luZyBNQUNzZWM6IHNhbml0
eQogICAgICAg4pyFIE5ldHdvcmtpbmcgc2N0cC1hdXRoOiBzb2Nrb3B0cyB0ZXN0CiAgICAgICDi
nIUgTmV0d29ya2luZyByb3V0ZTogcG10dQogICAgICAg4pyFIE5ldHdvcmtpbmcgcm91dGVfZnVu
YyAtIGxvY2FsCiAgICAgICDinIUgTmV0d29ya2luZyByb3V0ZV9mdW5jIC0gZm9yd2FyZAogICAg
ICAg4pyFIE5ldHdvcmtpbmcgVENQOiBrZWVwYWxpdmUgdGVzdAogICAgICAg4pyFIE5ldHdvcmtp
bmcgVURQOiBzb2NrZXQKICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ2VuZXZlIGJhc2lj
IHRlc3QKICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ3JlIGJhc2ljCiAgICAgICDinIUg
TDJUUCBiYXNpYyB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZyB0dW5uZWw6IHZ4bGFuIGJhc2lj
CiAgICAgICDinIUgTmV0d29ya2luZyBpcHNlYzogYmFzaWMgbmV0bnMgLSB0cmFuc3BvcnQKICAg
ICAgIOKchSBOZXR3b3JraW5nIGlwc2VjOiBiYXNpYyBuZXRucyAtIHR1bm5lbAogICAgICAg4p2M
IGF1ZGl0OiBhdWRpdCB0ZXN0c3VpdGUgdGVzdAogICAgICAg4pyFIGh0dHBkOiBtb2Rfc3NsIHNt
b2tlIHNhbml0eQogICAgICAg4pyFIHR1bmVkOiB0dW5lLXByb2Nlc3Nlcy10aHJvdWdoLXBlcmYK
ICAgICAgIOKchSB0cmFjZTogZnRyYWNlL3RyYWNlcgogICAgICAg8J+apyDinIUgQ0lGUyBDb25u
ZWN0YXRob24KICAgICAgIPCfmqcg4pyFIFBPU0lYIHBqZC1mc3Rlc3Qgc3VpdGVzCiAgICAgICDw
n5qnIOKchSBqdm0gLSBEYUNhcG8gQmVuY2htYXJrIFN1aXRlCiAgICAgICDwn5qnIOKchSBqdm0g
LSBqY3N0cmVzcyB0ZXN0cwogICAgICAg8J+apyDinIUgTWVtb3J5IGZ1bmN0aW9uOiBrYXNscgog
ICAgICAg8J+apyDinIUgTFRQOiBvcGVucG9zaXggdGVzdCBzdWl0ZQogICAgICAg8J+apyDinIUg
TmV0d29ya2luZyB2bmljOiBpcHZsYW4vYmFzaWMKICAgICAgIPCfmqcg4p2MIGlvdG9wOiBzYW5p
dHkKICAgICAgIPCfmqcg4pyFIHN0b3JhZ2U6IGRtL2NvbW1vbgoKICAgIEhvc3QgMjoKICAgICAg
IOKchSBCb290IHRlc3QKICAgICAgIOKchSBzZWxpbnV4LXBvbGljeTogc2VyZ2UtdGVzdHN1aXRl
CiAgICAgICDinIUgc3RyZXNzOiBzdHJlc3MtbmcKICAgICAgIPCfmqcg4pyFIFN0b3JhZ2UgYmxr
dGVzdHMKCiAgeDg2XzY0OgogICAgSG9zdCAxOgogICAgICAg4pyFIEJvb3QgdGVzdAogICAgICAg
4pyFIFBvZG1hbiBzeXN0ZW0gaW50ZWdyYXRpb24gdGVzdCAtIGFzIHJvb3QKICAgICAgIOKchSBQ
b2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRlc3QgLSBhcyB1c2VyCiAgICAgICDinYwgTFRQCiAg
ICAgICDinIUgTG9vcGRldiBTYW5pdHkKICAgICAgIOKchSBNZW1vcnkgZnVuY3Rpb246IG1lbWZk
X2NyZWF0ZQogICAgICAg4pyFIEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVzdCBVdGlsaXR5KQog
ICAgICAg4pyFIE5ldHdvcmtpbmcgYnJpZGdlOiBzYW5pdHkKICAgICAgIOKchSBFdGhlcm5ldCBk
cml2ZXJzIHNhbml0eQogICAgICAg4pyFIE5ldHdvcmtpbmcgTUFDc2VjOiBzYW5pdHkKICAgICAg
IOKchSBOZXR3b3JraW5nIHNvY2tldDogZnV6egogICAgICAg4pyFIE5ldHdvcmtpbmcgc2N0cC1h
dXRoOiBzb2Nrb3B0cyB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZzogaWdtcCBjb25mb3JtYW5j
ZSB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZyByb3V0ZTogcG10dQogICAgICAg4pyFIE5ldHdv
cmtpbmcgcm91dGVfZnVuYyAtIGxvY2FsCiAgICAgICDinIUgTmV0d29ya2luZyByb3V0ZV9mdW5j
IC0gZm9yd2FyZAogICAgICAg4pyFIE5ldHdvcmtpbmcgVENQOiBrZWVwYWxpdmUgdGVzdAogICAg
ICAg4pyFIE5ldHdvcmtpbmcgVURQOiBzb2NrZXQKICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5l
bDogZ2VuZXZlIGJhc2ljIHRlc3QKICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ3JlIGJh
c2ljCiAgICAgICDinIUgTDJUUCBiYXNpYyB0ZXN0CiAgICAgICDinIUgTmV0d29ya2luZyB0dW5u
ZWw6IHZ4bGFuIGJhc2ljCiAgICAgICDinIUgTmV0d29ya2luZyBpcHNlYzogYmFzaWMgbmV0bnMg
LSB0cmFuc3BvcnQKICAgICAgIOKchSBOZXR3b3JraW5nIGlwc2VjOiBiYXNpYyBuZXRucyAtIHR1
bm5lbAogICAgICAg4p2MIGF1ZGl0OiBhdWRpdCB0ZXN0c3VpdGUgdGVzdAogICAgICAg4pyFIGh0
dHBkOiBtb2Rfc3NsIHNtb2tlIHNhbml0eQogICAgICAg4pyFIHR1bmVkOiB0dW5lLXByb2Nlc3Nl
cy10aHJvdWdoLXBlcmYKICAgICAgIOKchSBwY2l1dGlsczogc2FuaXR5IHNtb2tlIHRlc3QKICAg
ICAgIOKchSBBTFNBIFBDTSBsb29wYmFjayB0ZXN0CiAgICAgICDinIUgQUxTQSBDb250cm9sICht
aXhlcikgVXNlcnNwYWNlIEVsZW1lbnQgdGVzdAogICAgICAg4pyFIHN0b3JhZ2U6IFNDU0kgVlBE
CiAgICAgICDinIUgdHJhY2U6IGZ0cmFjZS90cmFjZXIKICAgICAgIPCfmqcg4pyFIENJRlMgQ29u
bmVjdGF0aG9uCiAgICAgICDwn5qnIOKdjCBQT1NJWCBwamQtZnN0ZXN0IHN1aXRlcwogICAgICAg
8J+apyDinIUganZtIC0gRGFDYXBvIEJlbmNobWFyayBTdWl0ZQogICAgICAg8J+apyDinIUganZt
IC0gamNzdHJlc3MgdGVzdHMKICAgICAgIPCfmqcg4pyFIE1lbW9yeSBmdW5jdGlvbjoga2FzbHIK
ICAgICAgIPCfmqcg4pyFIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGUKICAgICAgIPCfmqcg4pyF
IE5ldHdvcmtpbmcgdm5pYzogaXB2bGFuL2Jhc2ljCiAgICAgICDwn5qnIOKchSBpb3RvcDogc2Fu
aXR5CiAgICAgICDwn5qnIOKchSBVc2V4IC0gdmVyc2lvbiAxLjktMjkKICAgICAgIPCfmqcg4pyF
IHN0b3JhZ2U6IGRtL2NvbW1vbgoKICAgIEhvc3QgMjoKICAgICAgIOKchSBCb290IHRlc3QKICAg
ICAgIOKchSBTdG9yYWdlIFNBTiBkZXZpY2Ugc3RyZXNzIC0gbXB0M3NhcyBkcml2ZXIKCiAgICBI
b3N0IDM6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDinIUgU3RvcmFnZSBTQU4gZGV2aWNl
IHN0cmVzcyAtIG1lZ2FyYWlkX3NhcwoKICAgIEhvc3QgNDoKICAgICAgIOKchSBCb290IHRlc3QK
ICAgICAgIOKchSB4ZnN0ZXN0cyAtIGV4dDQKICAgICAgIOKchSB4ZnN0ZXN0cyAtIHhmcwogICAg
ICAg4pyFIHNlbGludXgtcG9saWN5OiBzZXJnZS10ZXN0c3VpdGUKICAgICAgIOKchSBsdm0gdGhp
bnAgc2FuaXR5CiAgICAgICDinIUgc3RvcmFnZTogc29mdHdhcmUgUkFJRCB0ZXN0aW5nCiAgICAg
ICDinIUgc3RyZXNzOiBzdHJlc3MtbmcKICAgICAgIPCfmqcg4pyFIElPTU1VIGJvb3QgdGVzdAog
ICAgICAg8J+apyDinIUgSVBNSSBkcml2ZXIgdGVzdAogICAgICAg8J+apyDinIUgSVBNSXRvb2wg
bG9vcCBzdHJlc3MgdGVzdAogICAgICAg8J+apyDinIUgU3RvcmFnZSBibGt0ZXN0cwoKICBUZXN0
IHNvdXJjZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9DS0ktcHJvamVjdC90ZXN0cy1iZWFrZXIKICAg
IPCfkpogUHVsbCByZXF1ZXN0cyBhcmUgd2VsY29tZSBmb3IgbmV3IHRlc3RzIG9yIGltcHJvdmVt
ZW50cyB0byBleGlzdGluZyB0ZXN0cyEKCkFib3J0ZWQgdGVzdHMKLS0tLS0tLS0tLS0tLQpUZXN0
cyB0aGF0IGRpZG4ndCBjb21wbGV0ZSBydW5uaW5nIHN1Y2Nlc3NmdWxseSBhcmUgbWFya2VkIHdp
dGgg4pqh4pqh4pqhLgpJZiB0aGlzIHdhcyBjYXVzZWQgYnkgYW4gaW5mcmFzdHJ1Y3R1cmUgaXNz
dWUsIHdlIHRyeSB0byBtYXJrIHRoYXQKZXhwbGljaXRseSBpbiB0aGUgcmVwb3J0LgoKV2FpdmVk
IHRlc3RzCi0tLS0tLS0tLS0tLQpJZiB0aGUgdGVzdCBydW4gaW5jbHVkZWQgd2FpdmVkIHRlc3Rz
LCB0aGV5IGFyZSBtYXJrZWQgd2l0aCDwn5qnLiBTdWNoIHRlc3RzIGFyZQpleGVjdXRlZCBidXQg
dGhlaXIgcmVzdWx0cyBhcmUgbm90IHRha2VuIGludG8gYWNjb3VudC4gVGVzdHMgYXJlIHdhaXZl
ZCB3aGVuCnRoZWlyIHJlc3VsdHMgYXJlIG5vdCByZWxpYWJsZSBlbm91Z2gsIGUuZy4gd2hlbiB0
aGV5J3JlIGp1c3QgaW50cm9kdWNlZCBvciBhcmUKYmVpbmcgZml4ZWQuCgpUZXN0aW5nIHRpbWVv
dXQKLS0tLS0tLS0tLS0tLS0tCldlIGFpbSB0byBwcm92aWRlIGEgcmVwb3J0IHdpdGhpbiByZWFz
b25hYmxlIHRpbWVmcmFtZS4gVGVzdHMgdGhhdCBoYXZlbid0CmZpbmlzaGVkIHJ1bm5pbmcgeWV0
IGFyZSBtYXJrZWQgd2l0aCDij7EuCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D8618391A
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 19:58:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98AA53C5EC3
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 19:58:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 27F613C5E8F
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 19:58:40 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 533901402F89
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 19:58:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584039518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bHnEm4CQ+uiEOphLuAqV5Veszr45DOf8VMQLxAqiNaM=;
 b=J/5TeVxUQQyMcXLyMYbNcKu23sLPhFRIu4bzfAs89LY5Ko1MDwx5iTt7AuKT8c3KpHh3gV
 ZtCeHu1OERbEv1W+fGZW7aUqUWHq+4xxkBR8kewDm7P/5ZKANtlYOFZS70OhOMJkd4Kwnl
 9cEBMuLYuF6yGJcbl3XcAPzsaphiIMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-U9v6D2OZOTGSy-vKKZeVvQ-1; Thu, 12 Mar 2020 14:58:34 -0400
X-MC-Unique: U9v6D2OZOTGSy-vKKZeVvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9007C1005509
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 18:58:33 +0000 (UTC)
Received: from [172.54.102.53] (cpt-1044.paas.prod.upshift.rdu2.redhat.com
 [10.0.19.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06D6D5C1B5;
 Thu, 12 Mar 2020 18:58:27 +0000 (UTC)
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
Date: Thu, 12 Mar 2020 18:58:27 -0000
Message-ID: <cki.6F7636A8E9.ORDSQ6COWY@redhat.com>
X-Gitlab-Pipeline-ID: 485473
X-Gitlab-Url: https://xci32.lab.eng.rdu2.redhat.com
X-Gitlab-Path: /cki-project/cki-pipeline/pipelines/485473
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] =?utf-8?q?=F0=9F=92=A5_PANICKED=3A_Test_report_for_kernel_?=
 =?utf-8?q?5=2E6=2E0-rc5-3cc6e2c=2Ecki_=28mainline=2Ekernel=2Eorg=29?=
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
ICAgQ29tbWl0OiAzY2M2ZTJjNTk5Y2QgLSBNZXJnZSB0YWcgJ2Zvci1saW51cy01LjYtMicgb2Yg
Z2l0Oi8vZ2l0aHViLmNvbS9jbWlueWFyZC9saW51eC1pcG1pCgpUaGUgcmVzdWx0cyBvZiB0aGVz
ZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93LgoKICAgIE92ZXJhbGwgcmVzdWx0
OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQogICAgICAgICAgICAgTWVyZ2U6IE9LCiAgICAg
ICAgICAgQ29tcGlsZTogT0sKICAgICAgICAgICAgIFRlc3RzOiBQQU5JQ0tFRAoKQWxsIGtlcm5l
bCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9ncyBhcmUgYXZhaWxhYmxlIGZvciBkb3du
bG9hZCBoZXJlOgoKICBodHRwczovL2NraS1hcnRpZmFjdHMuczMudXMtZWFzdC0yLmFtYXpvbmF3
cy5jb20vaW5kZXguaHRtbD9wcmVmaXg9ZGF0YXdhcmVob3VzZS8yMDIwLzAzLzEyLzQ4NTQ3MwoK
T25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKCiAgICB4ODZfNjQ6CiAgICAg8J+SpSBM
VFAKICAgICDwn5KlIHhmc3Rlc3RzIC0gZXh0NAoKV2UgaG9wZSB0aGF0IHRoZXNlIGxvZ3MgY2Fu
IGhlbHAgeW91IGZpbmQgdGhlIHByb2JsZW0gcXVpY2tseS4gRm9yIHRoZSBmdWxsCmRldGFpbCBv
biBvdXIgdGVzdGluZyBwcm9jZWR1cmVzLCBwbGVhc2Ugc2Nyb2xsIHRvIHRoZSBib3R0b20gb2Yg
dGhpcyBtZXNzYWdlLgoKUGxlYXNlIHJlcGx5IHRvIHRoaXMgZW1haWwgaWYgeW91IGhhdmUgYW55
IHF1ZXN0aW9ucyBhYm91dCB0aGUgdGVzdHMgdGhhdCB3ZQpyYW4gb3IgaWYgeW91IGhhdmUgYW55
IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBtYWtlIGZ1dHVyZSB0ZXN0cyBtb3JlIGVmZmVjdGl2ZS4K
CiAgICAgICAgLC0uICAgLC0uCiAgICAgICAoIEMgKSAoIEsgKSAgQ29udGludW91cwogICAgICAg
IGAtJywtLmAtJyAgIEtlcm5lbAogICAgICAgICAgKCBJICkgICAgIEludGVncmF0aW9uCiAgICAg
ICAgICAgYC0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQ29tcGlsZSB0ZXN0aW5nCi0tLS0tLS0t
LS0tLS0tLQoKV2UgY29tcGlsZWQgdGhlIGtlcm5lbCBmb3IgMSBhcmNoaXRlY3R1cmU6CgogICAg
eDg2XzY0OgogICAgICBtYWtlIG9wdGlvbnM6IC1qMzAgSU5TVEFMTF9NT0RfU1RSSVA9MSB0YXJn
ei1wa2cKCgpIYXJkd2FyZSB0ZXN0aW5nCi0tLS0tLS0tLS0tLS0tLS0KV2UgYm9vdGVkIGVhY2gg
a2VybmVsIGFuZCByYW4gdGhlIGZvbGxvd2luZyB0ZXN0czoKCiAgeDg2XzY0OgogICAgSG9zdCAx
OgogICAgICAg4pyFIEJvb3QgdGVzdAogICAgICAg4pyFIFN0b3JhZ2UgU0FOIGRldmljZSBzdHJl
c3MgLSBtZWdhcmFpZF9zYXMKCiAgICBIb3N0IDI6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAg
ICDinIUgUG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0ZXN0IC0gYXMgcm9vdAogICAgICAg4pyF
IFBvZG1hbiBzeXN0ZW0gaW50ZWdyYXRpb24gdGVzdCAtIGFzIHVzZXIKICAgICAgIPCfkqUgTFRQ
CiAgICAgICDimqHimqHimqEgTG9vcGRldiBTYW5pdHkKICAgICAgIOKaoeKaoeKaoSBNZW1vcnkg
ZnVuY3Rpb246IG1lbWZkX2NyZWF0ZQogICAgICAg4pqh4pqh4pqhIEFNVFUgKEFic3RyYWN0IE1h
Y2hpbmUgVGVzdCBVdGlsaXR5KQogICAgICAg4pqh4pqh4pqhIE5ldHdvcmtpbmcgYnJpZGdlOiBz
YW5pdHkKICAgICAgIOKaoeKaoeKaoSBFdGhlcm5ldCBkcml2ZXJzIHNhbml0eQogICAgICAg4pqh
4pqh4pqhIE5ldHdvcmtpbmcgTUFDc2VjOiBzYW5pdHkKICAgICAgIOKaoeKaoeKaoSBOZXR3b3Jr
aW5nIHNvY2tldDogZnV6egogICAgICAg4pqh4pqh4pqhIE5ldHdvcmtpbmcgc2N0cC1hdXRoOiBz
b2Nrb3B0cyB0ZXN0CiAgICAgICDimqHimqHimqEgTmV0d29ya2luZzogaWdtcCBjb25mb3JtYW5j
ZSB0ZXN0CiAgICAgICDimqHimqHimqEgTmV0d29ya2luZyByb3V0ZTogcG10dQogICAgICAg4pqh
4pqh4pqhIE5ldHdvcmtpbmcgcm91dGVfZnVuYyAtIGxvY2FsCiAgICAgICDimqHimqHimqEgTmV0
d29ya2luZyByb3V0ZV9mdW5jIC0gZm9yd2FyZAogICAgICAg4pqh4pqh4pqhIE5ldHdvcmtpbmcg
VENQOiBrZWVwYWxpdmUgdGVzdAogICAgICAg4pqh4pqh4pqhIE5ldHdvcmtpbmcgVURQOiBzb2Nr
ZXQKICAgICAgIOKaoeKaoeKaoSBOZXR3b3JraW5nIHR1bm5lbDogZ2VuZXZlIGJhc2ljIHRlc3QK
ICAgICAgIOKaoeKaoeKaoSBOZXR3b3JraW5nIHR1bm5lbDogZ3JlIGJhc2ljCiAgICAgICDimqHi
mqHimqEgTDJUUCBiYXNpYyB0ZXN0CiAgICAgICDimqHimqHimqEgTmV0d29ya2luZyB0dW5uZWw6
IHZ4bGFuIGJhc2ljCiAgICAgICDimqHimqHimqEgTmV0d29ya2luZyBpcHNlYzogYmFzaWMgbmV0
bnMgLSB0cmFuc3BvcnQKICAgICAgIOKaoeKaoeKaoSBOZXR3b3JraW5nIGlwc2VjOiBiYXNpYyBu
ZXRucyAtIHR1bm5lbAogICAgICAg4pqh4pqh4pqhIGh0dHBkOiBtb2Rfc3NsIHNtb2tlIHNhbml0
eQogICAgICAg4pqh4pqh4pqhIHR1bmVkOiB0dW5lLXByb2Nlc3Nlcy10aHJvdWdoLXBlcmYKICAg
ICAgIOKaoeKaoeKaoSBwY2l1dGlsczogc2FuaXR5IHNtb2tlIHRlc3QKICAgICAgIOKaoeKaoeKa
oSBBTFNBIFBDTSBsb29wYmFjayB0ZXN0CiAgICAgICDimqHimqHimqEgQUxTQSBDb250cm9sICht
aXhlcikgVXNlcnNwYWNlIEVsZW1lbnQgdGVzdAogICAgICAg4pqh4pqh4pqhIHN0b3JhZ2U6IFND
U0kgVlBECiAgICAgICDimqHimqHimqEgdHJhY2U6IGZ0cmFjZS90cmFjZXIKICAgICAgIPCfmqcg
4pqh4pqh4pqhIENJRlMgQ29ubmVjdGF0aG9uCiAgICAgICDwn5qnIOKaoeKaoeKaoSBQT1NJWCBw
amQtZnN0ZXN0IHN1aXRlcwogICAgICAg8J+apyDimqHimqHimqEganZtIC0gRGFDYXBvIEJlbmNo
bWFyayBTdWl0ZQogICAgICAg8J+apyDimqHimqHimqEganZtIC0gamNzdHJlc3MgdGVzdHMKICAg
ICAgIPCfmqcg4pqh4pqh4pqhIE1lbW9yeSBmdW5jdGlvbjoga2FzbHIKICAgICAgIPCfmqcg4pqh
4pqh4pqhIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGUKICAgICAgIPCfmqcg4pqh4pqh4pqhIE5l
dHdvcmtpbmcgdm5pYzogaXB2bGFuL2Jhc2ljCiAgICAgICDwn5qnIOKaoeKaoeKaoSBhdWRpdDog
YXVkaXQgdGVzdHN1aXRlIHRlc3QKICAgICAgIPCfmqcg4pqh4pqh4pqhIGlvdG9wOiBzYW5pdHkK
ICAgICAgIPCfmqcg4pqh4pqh4pqhIFVzZXggLSB2ZXJzaW9uIDEuOS0yOQogICAgICAg8J+apyDi
mqHimqHimqEgc3RvcmFnZTogZG0vY29tbW9uCgogICAgSG9zdCAzOgogICAgICAg4pyFIEJvb3Qg
dGVzdAogICAgICAg4pyFIFN0b3JhZ2UgU0FOIGRldmljZSBzdHJlc3MgLSBtcHQzc2FzIGRyaXZl
cgoKICAgIEhvc3QgNDoKICAgICAgIOKchSBCb290IHRlc3QKICAgICAgIPCfkqUgeGZzdGVzdHMg
LSBleHQ0CiAgICAgICDimqHimqHimqEgeGZzdGVzdHMgLSB4ZnMKICAgICAgIOKaoeKaoeKaoSBs
dm0gdGhpbnAgc2FuaXR5CiAgICAgICDimqHimqHimqEgc3RvcmFnZTogc29mdHdhcmUgUkFJRCB0
ZXN0aW5nCiAgICAgICDimqHimqHimqEgc3RyZXNzOiBzdHJlc3MtbmcKICAgICAgIPCfmqcg4pqh
4pqh4pqhIElPTU1VIGJvb3QgdGVzdAogICAgICAg8J+apyDimqHimqHimqEgSVBNSSBkcml2ZXIg
dGVzdAogICAgICAg8J+apyDimqHimqHimqEgSVBNSXRvb2wgbG9vcCBzdHJlc3MgdGVzdAogICAg
ICAg8J+apyDimqHimqHimqEgc2VsaW51eC1wb2xpY3k6IHNlcmdlLXRlc3RzdWl0ZQogICAgICAg
8J+apyDimqHimqHimqEgcG93ZXItbWFuYWdlbWVudDogY3B1cG93ZXIvc2FuaXR5IHRlc3QKICAg
ICAgIPCfmqcg4pqh4pqh4pqhIFN0b3JhZ2UgYmxrdGVzdHMKCiAgVGVzdCBzb3VyY2VzOiBodHRw
czovL2dpdGh1Yi5jb20vQ0tJLXByb2plY3QvdGVzdHMtYmVha2VyCiAgICDwn5KaIFB1bGwgcmVx
dWVzdHMgYXJlIHdlbGNvbWUgZm9yIG5ldyB0ZXN0cyBvciBpbXByb3ZlbWVudHMgdG8gZXhpc3Rp
bmcgdGVzdHMhCgpBYm9ydGVkIHRlc3RzCi0tLS0tLS0tLS0tLS0KVGVzdHMgdGhhdCBkaWRuJ3Qg
Y29tcGxldGUgcnVubmluZyBzdWNjZXNzZnVsbHkgYXJlIG1hcmtlZCB3aXRoIOKaoeKaoeKaoS4K
SWYgdGhpcyB3YXMgY2F1c2VkIGJ5IGFuIGluZnJhc3RydWN0dXJlIGlzc3VlLCB3ZSB0cnkgdG8g
bWFyayB0aGF0CmV4cGxpY2l0bHkgaW4gdGhlIHJlcG9ydC4KCldhaXZlZCB0ZXN0cwotLS0tLS0t
LS0tLS0KSWYgdGhlIHRlc3QgcnVuIGluY2x1ZGVkIHdhaXZlZCB0ZXN0cywgdGhleSBhcmUgbWFy
a2VkIHdpdGgg8J+apy4gU3VjaCB0ZXN0cyBhcmUKZXhlY3V0ZWQgYnV0IHRoZWlyIHJlc3VsdHMg
YXJlIG5vdCB0YWtlbiBpbnRvIGFjY291bnQuIFRlc3RzIGFyZSB3YWl2ZWQgd2hlbgp0aGVpciBy
ZXN1bHRzIGFyZSBub3QgcmVsaWFibGUgZW5vdWdoLCBlLmcuIHdoZW4gdGhleSdyZSBqdXN0IGlu
dHJvZHVjZWQgb3IgYXJlCmJlaW5nIGZpeGVkLgoKVGVzdGluZyB0aW1lb3V0Ci0tLS0tLS0tLS0t
LS0tLQpXZSBhaW0gdG8gcHJvdmlkZSBhIHJlcG9ydCB3aXRoaW4gcmVhc29uYWJsZSB0aW1lZnJh
bWUuIFRlc3RzIHRoYXQgaGF2ZW4ndApmaW5pc2hlZCBydW5uaW5nIHlldCBhcmUgbWFya2VkIHdp
dGgg4o+xLgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK

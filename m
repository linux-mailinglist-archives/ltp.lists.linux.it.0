Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBC819031C
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 01:56:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71DFA3C4E55
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 01:56:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 000243C0300
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 01:56:24 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 80FEA600AB1
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 01:56:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585011382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/L9ihyOpEvtPN6fKLmozTlAYr82IEKciWsWRm/qkcDM=;
 b=V/Hb/JFhENMD0lK8tjgqk6xqsN+VpGza72kyjAAREQFQ/cS6k66/HwLEscdGl/TD0Q6hPZ
 PWetixUBaITg7XoStLbrNyh4B34OyZEECU1zAfLtirU7dWPPyOtMDFMAb2dO6tGdTx/sWM
 UZnTkjM6cNdIZ6Uwd69tY9JylxcdOeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-cKCkfkKuPM2G24wgd_cGfw-1; Mon, 23 Mar 2020 20:56:10 -0400
X-MC-Unique: cKCkfkKuPM2G24wgd_cGfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D03991851C14
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 00:56:09 +0000 (UTC)
Received: from [172.54.50.34] (cpt-1014.paas.prod.upshift.rdu2.redhat.com
 [10.0.19.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8453F5DA7B;
 Tue, 24 Mar 2020 00:56:03 +0000 (UTC)
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: skt-results-master@redhat.com, jforbes@redhat.com, jcline@redhat.com
Date: Tue, 24 Mar 2020 00:56:03 -0000
Message-ID: <cki.0.9NFIKZ9EH2@redhat.com>
X-Gitlab-Pipeline-ID: 502235
X-Gitlab-Url: https://xci32.lab.eng.rdu2.redhat.com
X-Gitlab-Path: /cki-project/brew-pipeline/pipelines/502235
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E5?=
 =?utf-8?q?=2E11-200=2Efc31_=28fedora-31=29?=
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

SGVsbG8gamZvcmJlcywKCldlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gdGhlIGZvbGxvd2luZyBr
ZXJuZWwgYnVpbGQ6CgogICAgS2VybmVsIHBhY2thZ2U6IGtlcm5lbC01LjUuMTEtMjAwLmZjMzEK
ICAgICAgICAgVGFzayBVUkw6IGh0dHBzOi8va29qaS5mZWRvcmFwcm9qZWN0Lm9yZy9rb2ppL3Rh
c2tpbmZvP3Rhc2tJRD00MjcyMzczNwoKVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRl
c3RzIGFyZSBwcm92aWRlZCBiZWxvdy4KCiAgICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUg
ZGV0YWlscyBiZWxvdykKICAgICAgICAgICAgIFRlc3RzOiBGQUlMRUQKCk9uZSBvciBtb3JlIGtl
cm5lbCB0ZXN0cyBmYWlsZWQ6CgogICAgcHBjNjRsZToKICAgICDinYwgTFRQCgoKCkFsbCBrZXJu
ZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxlcywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IgZG93
bmxvYWQgaGVyZToKCiAgaHR0cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6b25h
d3MuY29tL2luZGV4Lmh0bWw/cHJlZml4PWRhdGF3YXJlaG91c2UvMjAyMC8wMy8yMy81MDIyMzUK
ClBsZWFzZSByZXBseSB0byB0aGlzIGVtYWlsIGlmIHlvdSBoYXZlIGFueSBxdWVzdGlvbnMgYWJv
dXQgdGhlIHRlc3RzIHRoYXQgd2UKcmFuIG9yIGlmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBv
biBob3cgdG8gbWFrZSBmdXR1cmUgdGVzdHMgbW9yZSBlZmZlY3RpdmUuCkZvciB0aGUgZnVsbCBk
ZXRhaWwgb24gb3VyIHRlc3RpbmcgcHJvY2VkdXJlcywgcGxlYXNlIHNjcm9sbCB0byB0aGUgYm90
dG9tIG9mCnRoaXMgbWVzc2FnZS4KCiAgICAgICAgLC0uICAgLC0uCiAgICAgICAoIEMgKSAoIEsg
KSAgQ29udGludW91cwogICAgICAgIGAtJywtLmAtJyAgIEtlcm5lbAogICAgICAgICAgKCBJICkg
ICAgIEludGVncmF0aW9uCiAgICAgICAgICAgYC0nCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKSGFy
ZHdhcmUgdGVzdGluZwotLS0tLS0tLS0tLS0tLS0tCldlIGJvb3RlZCBlYWNoIGtlcm5lbCBhbmQg
cmFuIHRoZSBmb2xsb3dpbmcgdGVzdHM6CgogIGFhcmNoNjQ6CiAgICBIb3N0IDE6CiAgICAgICDi
nIUgQm9vdCB0ZXN0CiAgICAgICDinIUgTFRQCiAgICAgICDinIUgTG9vcGRldiBTYW5pdHkKICAg
ICAgIOKchSBNZW1vcnkgZnVuY3Rpb246IG1lbWZkX2NyZWF0ZQogICAgICAg4pyFIEFNVFUgKEFi
c3RyYWN0IE1hY2hpbmUgVGVzdCBVdGlsaXR5KQogICAgICAg4pyFIEV0aGVybmV0IGRyaXZlcnMg
c2FuaXR5CiAgICAgICDwn5qnIOKchSBDSUZTIENvbm5lY3RhdGhvbgogICAgICAg8J+apyDinIUg
TFRQOiBvcGVucG9zaXggdGVzdCBzdWl0ZQoKICAgIEhvc3QgMjoKICAgICAgIOKchSBCb290IHRl
c3QKICAgICAgIOKchSB4ZnN0ZXN0cyAtIGV4dDQKICAgICAgIOKchSB4ZnN0ZXN0cyAtIHhmcwog
ICAgICAg4pyFIGx2bSB0aGlucCBzYW5pdHkKICAgICAgIOKchSBzdHJlc3M6IHN0cmVzcy1uZwog
ICAgICAg8J+apyDinIUgU3RvcmFnZSBibGt0ZXN0cwoKICBwcGM2NGxlOgogICAgSG9zdCAxOgog
ICAgICAg4pyFIEJvb3QgdGVzdAogICAgICAg4pyFIHhmc3Rlc3RzIC0gZXh0NAogICAgICAg4pyF
IHhmc3Rlc3RzIC0geGZzCiAgICAgICDinIUgbHZtIHRoaW5wIHNhbml0eQogICAgICAg8J+apyDi
nIUgU3RvcmFnZSBibGt0ZXN0cwoKICAgIEhvc3QgMjoKICAgICAgIOKchSBCb290IHRlc3QKICAg
ICAgIOKdjCBMVFAKICAgICAgIOKchSBMb29wZGV2IFNhbml0eQogICAgICAg4pyFIE1lbW9yeSBm
dW5jdGlvbjogbWVtZmRfY3JlYXRlCiAgICAgICDinIUgQU1UVSAoQWJzdHJhY3QgTWFjaGluZSBU
ZXN0IFV0aWxpdHkpCiAgICAgICDinIUgRXRoZXJuZXQgZHJpdmVycyBzYW5pdHkKICAgICAgIPCf
mqcg4pyFIENJRlMgQ29ubmVjdGF0aG9uCiAgICAgICDwn5qnIOKchSBMVFA6IG9wZW5wb3NpeCB0
ZXN0IHN1aXRlCgogIHMzOTB4OgogICAgSG9zdCAxOgogICAgICAg4pyFIEJvb3QgdGVzdAogICAg
ICAg4pyFIExvb3BkZXYgU2FuaXR5CiAgICAgICDinIUgTWVtb3J5IGZ1bmN0aW9uOiBtZW1mZF9j
cmVhdGUKICAgICAgIOKchSBFdGhlcm5ldCBkcml2ZXJzIHNhbml0eQogICAgICAg8J+apyDinIUg
Q0lGUyBDb25uZWN0YXRob24KICAgICAgIPCfmqcg4pyFIExUUDogb3BlbnBvc2l4IHRlc3Qgc3Vp
dGUKCiAgICBIb3N0IDI6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDwn5qnIOKchSBTdG9y
YWdlIGJsa3Rlc3RzCgogIHg4Nl82NDoKICAgIEhvc3QgMToKICAgICAgIOKchSBCb290IHRlc3QK
ICAgICAgIOKchSB4ZnN0ZXN0cyAtIGV4dDQKICAgICAgIOKchSB4ZnN0ZXN0cyAtIHhmcwogICAg
ICAg4pyFIGx2bSB0aGlucCBzYW5pdHkKICAgICAgIOKchSBzdHJlc3M6IHN0cmVzcy1uZwogICAg
ICAg8J+apyDinIUgU3RvcmFnZSBibGt0ZXN0cwoKICAgIEhvc3QgMjoKICAgICAgIOKchSBCb290
IHRlc3QKICAgICAgIOKchSBMVFAKICAgICAgIOKchSBMb29wZGV2IFNhbml0eQogICAgICAg4pyF
IE1lbW9yeSBmdW5jdGlvbjogbWVtZmRfY3JlYXRlCiAgICAgICDinIUgQU1UVSAoQWJzdHJhY3Qg
TWFjaGluZSBUZXN0IFV0aWxpdHkpCiAgICAgICDinIUgRXRoZXJuZXQgZHJpdmVycyBzYW5pdHkK
ICAgICAgIPCfmqcg4pyFIENJRlMgQ29ubmVjdGF0aG9uCiAgICAgICDwn5qnIOKchSBMVFA6IG9w
ZW5wb3NpeCB0ZXN0IHN1aXRlCgogIFRlc3Qgc291cmNlczogaHR0cHM6Ly9naXRodWIuY29tL0NL
SS1wcm9qZWN0L3Rlc3RzLWJlYWtlcgogICAg8J+SmiBQdWxsIHJlcXVlc3RzIGFyZSB3ZWxjb21l
IGZvciBuZXcgdGVzdHMgb3IgaW1wcm92ZW1lbnRzIHRvIGV4aXN0aW5nIHRlc3RzIQoKQWJvcnRl
ZCB0ZXN0cwotLS0tLS0tLS0tLS0tClRlc3RzIHRoYXQgZGlkbid0IGNvbXBsZXRlIHJ1bm5pbmcg
c3VjY2Vzc2Z1bGx5IGFyZSBtYXJrZWQgd2l0aCDimqHimqHimqEuCklmIHRoaXMgd2FzIGNhdXNl
ZCBieSBhbiBpbmZyYXN0cnVjdHVyZSBpc3N1ZSwgd2UgdHJ5IHRvIG1hcmsgdGhhdApleHBsaWNp
dGx5IGluIHRoZSByZXBvcnQuCgpXYWl2ZWQgdGVzdHMKLS0tLS0tLS0tLS0tCklmIHRoZSB0ZXN0
IHJ1biBpbmNsdWRlZCB3YWl2ZWQgdGVzdHMsIHRoZXkgYXJlIG1hcmtlZCB3aXRoIPCfmqcuIFN1
Y2ggdGVzdHMgYXJlCmV4ZWN1dGVkIGJ1dCB0aGVpciByZXN1bHRzIGFyZSBub3QgdGFrZW4gaW50
byBhY2NvdW50LiBUZXN0cyBhcmUgd2FpdmVkIHdoZW4KdGhlaXIgcmVzdWx0cyBhcmUgbm90IHJl
bGlhYmxlIGVub3VnaCwgZS5nLiB3aGVuIHRoZXkncmUganVzdCBpbnRyb2R1Y2VkIG9yIGFyZQpi
ZWluZyBmaXhlZC4KClRlc3RpbmcgdGltZW91dAotLS0tLS0tLS0tLS0tLS0KV2UgYWltIHRvIHBy
b3ZpZGUgYSByZXBvcnQgd2l0aGluIHJlYXNvbmFibGUgdGltZWZyYW1lLiBUZXN0cyB0aGF0IGhh
dmVuJ3QKZmluaXNoZWQgcnVubmluZyB5ZXQgYXJlIG1hcmtlZCB3aXRoIOKPsS4KCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

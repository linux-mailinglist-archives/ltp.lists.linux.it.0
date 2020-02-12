Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6026A15A967
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 13:47:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 126933C25DD
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 13:47:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 50C6D3C2284
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 13:47:50 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9ABDB601DD2
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 13:47:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581511666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NypodQOPawrFFlIVKRWimyCKUXXAokxP7Un3PBVbTk8=;
 b=VEssuu7qkMEXTM04i+FA2HtwE+UlUlAEtv6Ro7PlP0WOrh9spUHZ+mGGni5wNjDk9BZsml
 lOwg4pQHc34+wL4WeMmloiQk999+Yon7aDunJ54NMCf/1nq3q+KsB54HmP7y0A6xuKN9nf
 1MPWm65kzGfrdNnhaQ76tfFwv7YI7l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-BXZtbK39O1uCc6BmowWQPQ-1; Wed, 12 Feb 2020 07:47:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBDFC10054E3
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 12:47:35 +0000 (UTC)
Received: from [172.54.100.3] (cpt-1059.paas.prod.upshift.rdu2.redhat.com
 [10.0.19.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09A4D2AAB4;
 Wed, 12 Feb 2020 12:47:28 +0000 (UTC)
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: skt-results-master@redhat.com, jforbes@redhat.com, jcline@redhat.com
Date: Wed, 12 Feb 2020 12:47:28 -0000
Message-ID: <cki.0.DS0DIXTWC0@redhat.com>
X-Gitlab-Pipeline-ID: 432806
X-Gitlab-Url: https://xci32.lab.eng.rdu2.redhat.com
X-Gitlab-Path: /cki-project/brew-pipeline/pipelines/432806
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: BXZtbK39O1uCc6BmowWQPQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E5?=
 =?utf-8?q?=2E3-200=2Efc31_=28fedora-31=29?=
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

SGVsbG8gamZvcmJlcywKCldlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSBrZXJuZWwgYnVpbGQg
dGhhdCB5b3Ugc2VudCB0byBLb2ppOgoKICAgIEtlcm5lbCBwYWNrYWdlOiBrZXJuZWwtNS41LjMt
MjAwLmZjMzEKICAgICAgICAgS29qaSB0YXNrOiBodHRwczovL2tvamkuZmVkb3JhcHJvamVjdC5v
cmcva29qaS90YXNraW5mbz90YXNrSUQ9NDE0NjEyODAKClRoZSByZXN1bHRzIG9mIHRoZXNlIGF1
dG9tYXRlZCB0ZXN0cyBhcmUgcHJvdmlkZWQgYmVsb3cuCgogICAgT3ZlcmFsbCByZXN1bHQ6IEZB
SUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCiAgICAgICAgICAgICBUZXN0czogRkFJTEVECgpPbmUg
b3IgbW9yZSBrZXJuZWwgdGVzdHMgZmFpbGVkOgoKICAgIHBwYzY0bGU6CiAgICAg4p2MIExUUAoK
CiAgICBQaXBlbGluZTogaHR0cHM6Ly94Y2kzMi5sYWIuZW5nLnJkdTIucmVkaGF0LmNvbS9ja2kt
cHJvamVjdC9icmV3LXBpcGVsaW5lL3BpcGVsaW5lcy80MzI4MDYKCldlIGhvcGUgdGhhdCB0aGVz
ZSBsb2dzIGNhbiBoZWxwIHlvdSBmaW5kIHRoZSBwcm9ibGVtIHF1aWNrbHkuIEZvciB0aGUgZnVs
bApkZXRhaWwgb24gb3VyIHRlc3RpbmcgcHJvY2VkdXJlcywgcGxlYXNlIHNjcm9sbCB0byB0aGUg
Ym90dG9tIG9mIHRoaXMgbWVzc2FnZS4KClBsZWFzZSByZXBseSB0byB0aGlzIGVtYWlsIGlmIHlv
dSBoYXZlIGFueSBxdWVzdGlvbnMgYWJvdXQgdGhlIHRlc3RzIHRoYXQgd2UKcmFuIG9yIGlmIHlv
dSBoYXZlIGFueSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gbWFrZSBmdXR1cmUgdGVzdHMgbW9yZSBl
ZmZlY3RpdmUuCgogICAgICAgICwtLiAgICwtLgogICAgICAgKCBDICkgKCBLICkgIENvbnRpbnVv
dXMKICAgICAgICBgLScsLS5gLScgICBLZXJuZWwKICAgICAgICAgICggSSApICAgICBJbnRlZ3Jh
dGlvbgogICAgICAgICAgIGAtJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCkhhcmR3YXJlIHRlc3Rp
bmcKLS0tLS0tLS0tLS0tLS0tLQpXZSBib290ZWQgZWFjaCBrZXJuZWwgYW5kIHJhbiB0aGUgZm9s
bG93aW5nIHRlc3RzOgoKICBhYXJjaDY0OgogICAgSG9zdCAxOgogICAgICAg4pyFIEJvb3QgdGVz
dAogICAgICAg4pyFIHhmc3Rlc3RzIC0gZXh0NAogICAgICAg4pyFIHhmc3Rlc3RzIC0geGZzCiAg
ICAgICDinIUgbHZtIHRoaW5wIHNhbml0eQogICAgICAg4pyFIHN0cmVzczogc3RyZXNzLW5nCiAg
ICAgICDwn5qnIOKchSBTdG9yYWdlIGJsa3Rlc3RzCgogICAgSG9zdCAyOgogICAgICAg4pyFIEJv
b3QgdGVzdAogICAgICAg4pyFIExUUAogICAgICAg4pyFIExvb3BkZXYgU2FuaXR5CiAgICAgICDi
nIUgTWVtb3J5IGZ1bmN0aW9uOiBtZW1mZF9jcmVhdGUKICAgICAgIOKchSBBTVRVIChBYnN0cmFj
dCBNYWNoaW5lIFRlc3QgVXRpbGl0eSkKICAgICAgIOKchSBFdGhlcm5ldCBkcml2ZXJzIHNhbml0
eQogICAgICAg8J+apyDinIUgQ0lGUyBDb25uZWN0YXRob24KICAgICAgIPCfmqcg4pyFIExUUDog
b3BlbnBvc2l4IHRlc3Qgc3VpdGUKCiAgcHBjNjRsZToKICAgIEhvc3QgMToKICAgICAgIOKchSBC
b290IHRlc3QKICAgICAgIOKchSB4ZnN0ZXN0cyAtIGV4dDQKICAgICAgIOKchSB4ZnN0ZXN0cyAt
IHhmcwogICAgICAg4pyFIGx2bSB0aGlucCBzYW5pdHkKICAgICAgIPCfmqcg4pyFIFN0b3JhZ2Ug
YmxrdGVzdHMKCiAgICBIb3N0IDI6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDinYwgTFRQ
CiAgICAgICDinIUgTG9vcGRldiBTYW5pdHkKICAgICAgIOKchSBNZW1vcnkgZnVuY3Rpb246IG1l
bWZkX2NyZWF0ZQogICAgICAg4pyFIEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVzdCBVdGlsaXR5
KQogICAgICAg4pyFIEV0aGVybmV0IGRyaXZlcnMgc2FuaXR5CiAgICAgICDwn5qnIOKchSBDSUZT
IENvbm5lY3RhdGhvbgogICAgICAg8J+apyDinIUgTFRQOiBvcGVucG9zaXggdGVzdCBzdWl0ZQoK
ICB4ODZfNjQ6CiAgICBIb3N0IDE6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDinIUgeGZz
dGVzdHMgLSBleHQ0CiAgICAgICDinIUgeGZzdGVzdHMgLSB4ZnMKICAgICAgIOKchSBsdm0gdGhp
bnAgc2FuaXR5CiAgICAgICDinIUgc3RyZXNzOiBzdHJlc3MtbmcKICAgICAgIPCfmqcg4pyFIFN0
b3JhZ2UgYmxrdGVzdHMKCiAgICBIb3N0IDI6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDi
nIUgTFRQCiAgICAgICDinIUgTG9vcGRldiBTYW5pdHkKICAgICAgIOKchSBNZW1vcnkgZnVuY3Rp
b246IG1lbWZkX2NyZWF0ZQogICAgICAg4pyFIEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVzdCBV
dGlsaXR5KQogICAgICAg4pyFIEV0aGVybmV0IGRyaXZlcnMgc2FuaXR5CiAgICAgICDwn5qnIOKc
hSBDSUZTIENvbm5lY3RhdGhvbgogICAgICAg8J+apyDinIUgTFRQOiBvcGVucG9zaXggdGVzdCBz
dWl0ZQoKICBUZXN0IHNvdXJjZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9DS0ktcHJvamVjdC90ZXN0
cy1iZWFrZXIKICAgIPCfkpogUHVsbCByZXF1ZXN0cyBhcmUgd2VsY29tZSBmb3IgbmV3IHRlc3Rz
IG9yIGltcHJvdmVtZW50cyB0byBleGlzdGluZyB0ZXN0cyEKCldhaXZlZCB0ZXN0cwotLS0tLS0t
LS0tLS0KSWYgdGhlIHRlc3QgcnVuIGluY2x1ZGVkIHdhaXZlZCB0ZXN0cywgdGhleSBhcmUgbWFy
a2VkIHdpdGgg8J+apy4gU3VjaCB0ZXN0cyBhcmUKZXhlY3V0ZWQgYnV0IHRoZWlyIHJlc3VsdHMg
YXJlIG5vdCB0YWtlbiBpbnRvIGFjY291bnQuIFRlc3RzIGFyZSB3YWl2ZWQgd2hlbgp0aGVpciBy
ZXN1bHRzIGFyZSBub3QgcmVsaWFibGUgZW5vdWdoLCBlLmcuIHdoZW4gdGhleSdyZSBqdXN0IGlu
dHJvZHVjZWQgb3IgYXJlCmJlaW5nIGZpeGVkLgoKVGVzdGluZyB0aW1lb3V0Ci0tLS0tLS0tLS0t
LS0tLQpXZSBhaW0gdG8gcHJvdmlkZSBhIHJlcG9ydCB3aXRoaW4gcmVhc29uYWJsZSB0aW1lZnJh
bWUuIFRlc3RzIHRoYXQgaGF2ZW4ndApmaW5pc2hlZCBydW5uaW5nIGFyZSBtYXJrZWQgd2l0aCDi
j7EuIFJlcG9ydHMgZm9yIG5vbi11cHN0cmVhbSBrZXJuZWxzIGhhdmUKYSBCZWFrZXIgcmVjaXBl
IGxpbmtlZCB0byBuZXh0IHRvIGVhY2ggaG9zdC4KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

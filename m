Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA7717B744
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 08:21:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FBBA3C63AF
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 08:21:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9BDA23C63A5
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 08:21:40 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9D7331000C31
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 08:21:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583479298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3qkc+aW+Yc0WFOYkzGi1TunQmbnwHF8ZqpK8axRtk2s=;
 b=DxhCl/qatQe3OGPm7ViaaeMVd1qWBIxw2K1sVLOsTYXHtfi3Kp2aRAvs0vxD/PF8XHHV5X
 KN+FEMGkJ5UpiRDYL4JHYQGpvAy5aEIMBPhuYQxRrK7l8nAvRJ5kVCIYYTts3/9VlMz+dx
 72Ou79TIiEGouzXmMbyvp7baMf6f8Ak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-5e6dN8bQOTS2BIR5nhKrOw-1; Fri, 06 Mar 2020 02:21:28 -0500
X-MC-Unique: 5e6dN8bQOTS2BIR5nhKrOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D6D7800D55
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 07:21:27 +0000 (UTC)
Received: from [172.54.80.59] (cpt-1035.paas.prod.upshift.rdu2.redhat.com
 [10.0.19.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9CB310016EB;
 Fri,  6 Mar 2020 07:21:21 +0000 (UTC)
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: skt-results-master@redhat.com, jforbes@redhat.com, jcline@redhat.com
Date: Fri, 06 Mar 2020 07:21:21 -0000
Message-ID: <cki.0.RUSFX6M3H7@redhat.com>
X-Gitlab-Pipeline-ID: 473884
X-Gitlab-Url: https://xci32.lab.eng.rdu2.redhat.com
X-Gitlab-Path: /cki-project/brew-pipeline/pipelines/473884
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E5?=
 =?utf-8?q?=2E8-200=2Efc31_=28fedora-31=29?=
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
ZXJuZWwgYnVpbGQ6CgogICAgS2VybmVsIHBhY2thZ2U6IGtlcm5lbC01LjUuOC0yMDAuZmMzMQog
ICAgICAgICBUYXNrIFVSTDogaHR0cHM6Ly9rb2ppLmZlZG9yYXByb2plY3Qub3JnL2tvamkvdGFz
a2luZm8/dGFza0lEPTQyMjI1NDMzCgpUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVz
dHMgYXJlIHByb3ZpZGVkIGJlbG93LgoKICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNlZSBk
ZXRhaWxzIGJlbG93KQogICAgICAgICAgICAgVGVzdHM6IEZBSUxFRAoKT25lIG9yIG1vcmUga2Vy
bmVsIHRlc3RzIGZhaWxlZDoKCiAgICBzMzkweDoKICAgICDinYwgTFRQCgoKCkFsbCBrZXJuZWwg
YmluYXJpZXMsIGNvbmZpZyBmaWxlcywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IgZG93bmxv
YWQgaGVyZToKCiAgaHR0cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6b25hd3Mu
Y29tL2luZGV4Lmh0bWw/cHJlZml4PWRhdGF3YXJlaG91c2UvMjAyMC8wMy8wNi80NzM4ODQKCgpX
ZSBob3BlIHRoYXQgdGhlc2UgbG9ncyBjYW4gaGVscCB5b3UgZmluZCB0aGUgcHJvYmxlbSBxdWlj
a2x5LiBGb3IgdGhlIGZ1bGwKZGV0YWlsIG9uIG91ciB0ZXN0aW5nIHByb2NlZHVyZXMsIHBsZWFz
ZSBzY3JvbGwgdG8gdGhlIGJvdHRvbSBvZiB0aGlzIG1lc3NhZ2UuCgpQbGVhc2UgcmVwbHkgdG8g
dGhpcyBlbWFpbCBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIGFib3V0IHRoZSB0ZXN0cyB0aGF0
IHdlCnJhbiBvciBpZiB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgb24gaG93IHRvIG1ha2UgZnV0
dXJlIHRlc3RzIG1vcmUgZWZmZWN0aXZlLgoKICAgICAgICAsLS4gICAsLS4KICAgICAgICggQyAp
ICggSyApICBDb250aW51b3VzCiAgICAgICAgYC0nLC0uYC0nICAgS2VybmVsCiAgICAgICAgICAo
IEkgKSAgICAgSW50ZWdyYXRpb24KICAgICAgICAgICBgLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CgpIYXJkd2FyZSB0ZXN0aW5nCi0tLS0tLS0tLS0tLS0tLS0KV2UgYm9vdGVkIGVhY2gga2VybmVs
IGFuZCByYW4gdGhlIGZvbGxvd2luZyB0ZXN0czoKCiAgYWFyY2g2NDoKICAgIEhvc3QgMToKICAg
ICAgIOKchSBCb290IHRlc3QKICAgICAgIOKchSB4ZnN0ZXN0cyAtIGV4dDQKICAgICAgIOKchSB4
ZnN0ZXN0cyAtIHhmcwogICAgICAg4pyFIGx2bSB0aGlucCBzYW5pdHkKICAgICAgIOKchSBzdHJl
c3M6IHN0cmVzcy1uZwogICAgICAg8J+apyDinIUgU3RvcmFnZSBibGt0ZXN0cwoKICAgIEhvc3Qg
MjoKICAgICAgIOKchSBCb290IHRlc3QKICAgICAgIOKchSBMVFAKICAgICAgIOKchSBMb29wZGV2
IFNhbml0eQogICAgICAg4pyFIE1lbW9yeSBmdW5jdGlvbjogbWVtZmRfY3JlYXRlCiAgICAgICDi
nIUgQU1UVSAoQWJzdHJhY3QgTWFjaGluZSBUZXN0IFV0aWxpdHkpCiAgICAgICDinIUgRXRoZXJu
ZXQgZHJpdmVycyBzYW5pdHkKICAgICAgIPCfmqcg4pyFIENJRlMgQ29ubmVjdGF0aG9uCiAgICAg
ICDwn5qnIOKchSBMVFA6IG9wZW5wb3NpeCB0ZXN0IHN1aXRlCgogIHBwYzY0bGU6CiAgICBIb3N0
IDE6CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDinIUgeGZzdGVzdHMgLSBleHQ0CiAgICAg
ICDinIUgeGZzdGVzdHMgLSB4ZnMKICAgICAgIOKchSBsdm0gdGhpbnAgc2FuaXR5CiAgICAgICDw
n5qnIOKchSBTdG9yYWdlIGJsa3Rlc3RzCgogICAgSG9zdCAyOgogICAgICAg4pyFIEJvb3QgdGVz
dAogICAgICAg4pyFIExUUAogICAgICAg4pyFIExvb3BkZXYgU2FuaXR5CiAgICAgICDinIUgTWVt
b3J5IGZ1bmN0aW9uOiBtZW1mZF9jcmVhdGUKICAgICAgIOKchSBBTVRVIChBYnN0cmFjdCBNYWNo
aW5lIFRlc3QgVXRpbGl0eSkKICAgICAgIOKchSBFdGhlcm5ldCBkcml2ZXJzIHNhbml0eQogICAg
ICAg8J+apyDinIUgQ0lGUyBDb25uZWN0YXRob24KICAgICAgIPCfmqcg4pyFIExUUDogb3BlbnBv
c2l4IHRlc3Qgc3VpdGUKCiAgczM5MHg6CiAgICBIb3N0IDE6CiAgICAgICDinIUgQm9vdCB0ZXN0
CiAgICAgICDinYwgTFRQCiAgICAgICDimqHimqHimqEgTG9vcGRldiBTYW5pdHkKICAgICAgIOKa
oeKaoeKaoSBNZW1vcnkgZnVuY3Rpb246IG1lbWZkX2NyZWF0ZQogICAgICAg4pqh4pqh4pqhIEV0
aGVybmV0IGRyaXZlcnMgc2FuaXR5CiAgICAgICDwn5qnIOKaoeKaoeKaoSBDSUZTIENvbm5lY3Rh
dGhvbgogICAgICAg8J+apyDimqHimqHimqEgTFRQOiBvcGVucG9zaXggdGVzdCBzdWl0ZQoKICAg
IEhvc3QgMjoKICAgICAgIOKchSBCb290IHRlc3QKICAgICAgIOKchSBzdHJlc3M6IHN0cmVzcy1u
ZwogICAgICAg8J+apyDinIUgU3RvcmFnZSBibGt0ZXN0cwoKICB4ODZfNjQ6CiAgICBIb3N0IDE6
CiAgICAgICDinIUgQm9vdCB0ZXN0CiAgICAgICDinIUgTFRQCiAgICAgICDinIUgTG9vcGRldiBT
YW5pdHkKICAgICAgIOKchSBNZW1vcnkgZnVuY3Rpb246IG1lbWZkX2NyZWF0ZQogICAgICAg4pyF
IEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVzdCBVdGlsaXR5KQogICAgICAg4pyFIEV0aGVybmV0
IGRyaXZlcnMgc2FuaXR5CiAgICAgICDwn5qnIOKchSBDSUZTIENvbm5lY3RhdGhvbgogICAgICAg
8J+apyDinIUgTFRQOiBvcGVucG9zaXggdGVzdCBzdWl0ZQoKICAgIEhvc3QgMjoKICAgICAgIOKc
hSBCb290IHRlc3QKICAgICAgIOKchSB4ZnN0ZXN0cyAtIGV4dDQKICAgICAgIOKchSB4ZnN0ZXN0
cyAtIHhmcwogICAgICAg4pyFIGx2bSB0aGlucCBzYW5pdHkKICAgICAgIOKchSBzdHJlc3M6IHN0
cmVzcy1uZwogICAgICAg8J+apyDinIUgU3RvcmFnZSBibGt0ZXN0cwoKICBUZXN0IHNvdXJjZXM6
IGh0dHBzOi8vZ2l0aHViLmNvbS9DS0ktcHJvamVjdC90ZXN0cy1iZWFrZXIKICAgIPCfkpogUHVs
bCByZXF1ZXN0cyBhcmUgd2VsY29tZSBmb3IgbmV3IHRlc3RzIG9yIGltcHJvdmVtZW50cyB0byBl
eGlzdGluZyB0ZXN0cyEKCldhaXZlZCB0ZXN0cwotLS0tLS0tLS0tLS0KSWYgdGhlIHRlc3QgcnVu
IGluY2x1ZGVkIHdhaXZlZCB0ZXN0cywgdGhleSBhcmUgbWFya2VkIHdpdGgg8J+apy4gU3VjaCB0
ZXN0cyBhcmUKZXhlY3V0ZWQgYnV0IHRoZWlyIHJlc3VsdHMgYXJlIG5vdCB0YWtlbiBpbnRvIGFj
Y291bnQuIFRlc3RzIGFyZSB3YWl2ZWQgd2hlbgp0aGVpciByZXN1bHRzIGFyZSBub3QgcmVsaWFi
bGUgZW5vdWdoLCBlLmcuIHdoZW4gdGhleSdyZSBqdXN0IGludHJvZHVjZWQgb3IgYXJlCmJlaW5n
IGZpeGVkLgoKVGVzdGluZyB0aW1lb3V0Ci0tLS0tLS0tLS0tLS0tLQpXZSBhaW0gdG8gcHJvdmlk
ZSBhIHJlcG9ydCB3aXRoaW4gcmVhc29uYWJsZSB0aW1lZnJhbWUuIFRlc3RzIHRoYXQgaGF2ZW4n
dApmaW5pc2hlZCBydW5uaW5nIHlldCBhcmUgbWFya2VkIHdpdGgg4o+xLgoKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DA016675C
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 20:43:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5245B3C2594
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 20:43:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CBB013C0781
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 20:43:08 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 596F314052E7
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 20:43:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582227785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVSSF09XwOssK8yY/5II/1giwG5duURP8nkL9//18cc=;
 b=KuDuzNB3TE4+SIiSDEBNU4kARgRJvJfcSdrp4gRWDqI4Ak9hFJAYjr7W6npuYriUbMKu86
 4CTy7vOXja0EZgXv1iyhPNl2df+9Buy9djAIGcnksx9QbTeN/0UY09/ahoAMLXAa5tJOOH
 xt6IUNkEFnIYfljjoCSULvK+HiEL+hE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-Wq80ucSGOzqnd-v0k-aXxg-1; Thu, 20 Feb 2020 14:42:58 -0500
X-MC-Unique: Wq80ucSGOzqnd-v0k-aXxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 503A38017CC;
 Thu, 20 Feb 2020 19:42:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 474CD87B0A;
 Thu, 20 Feb 2020 19:42:56 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0813C866DA;
 Thu, 20 Feb 2020 19:42:56 +0000 (UTC)
Date: Thu, 20 Feb 2020 14:42:55 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>
Message-ID: <1011809226.8353012.1582227775821.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.C7F44073DC.K13BODGQAA@redhat.com>
References: <cki.C7F44073DC.K13BODGQAA@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.11]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.4.21-2d636a1.cki (stable)
Thread-Index: zGHFPwxkGH3VdIVSrLocgrXxhi0zhw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E21-2d636a1=2Ecki_=28stable=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 Linux Stable maillist <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gSGVsbG8sCj4gCj4gV2UgcmFuIGF1
dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0cmVlOgo+
IAo+ICAgICAgICBLZXJuZWwgcmVwbzoKPiAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0Cj4gICAgICAg
ICAgICAgQ29tbWl0OiAyZDYzNmExMjYzYmUgLSBMaW51eCA1LjQuMjEKPiAKPiBUaGUgcmVzdWx0
cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93Lgo+IAo+ICAgICBP
dmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiAgICAgICAgICAgICAg
TWVyZ2U6IE9LCj4gICAgICAgICAgICBDb21waWxlOiBPSwo+ICAgICAgICAgICAgICBUZXN0czog
RkFJTEVECj4gCj4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9ncyBh
cmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZCBoZXJlOgo+IAo+ICAgaHR0cHM6Ly9ja2ktYXJ0aWZh
Y3RzLnMzLnVzLWVhc3QtMi5hbWF6b25hd3MuY29tL2luZGV4Lmh0bWw/cHJlZml4PWRhdGF3YXJl
aG91c2UvMjAyMC8wMi8xOS80NDY2OTMKPiAKPiBPbmUgb3IgbW9yZSBrZXJuZWwgdGVzdHMgZmFp
bGVkOgo+IAo+ICAgICBwcGM2NGxlOgo+ICAgICAg4p2MIExUUAoKVGhpcyBpcyB3YXJuaW5nIGZy
b20gcHJlYWR2MjAzLCBiZWNhdXNlIGl0IGZhaWxlZCB0byBjbGVhciBsb29wIGRldmljZS4KS2Vy
bmVsIHJlcG9ydHMgYW4gSS9PIGVycm9yOgoKWyAyMzM4Ljc4Njg1NF0gYmxrX3VwZGF0ZV9yZXF1
ZXN0OiBJL08gZXJyb3IsIGRldiBsb29wMCwgc2VjdG9yIDUxMiBvcCAweDA6KFJFQUQpIGZsYWdz
IDB4MCBwaHlzX3NlZyAxIHByaW8gY2xhc3MgMAoKdHN0X3Rlc3QuYzoxMjc4OiBJTkZPOiBUZXN0
aW5nIG9uIGV4dDMKdHN0X21rZnMuYzo4OTogSU5GTzogRm9ybWF0dGluZyAvZGV2L2xvb3AwIHdp
dGggZXh0MyBvcHRzPScnIGV4dHJhIG9wdHM9JycKbWtlMmZzIDEuNDUuNSAoMDctSmFuLTIwMjAp
CnRzdF90ZXN0LmM6MTIxNTogSU5GTzogVGltZW91dCBwZXIgcnVuIGlzIDBoIDA1bSAwMHMKcHJl
YWR2MjAzLmM6MTQzOiBJTkZPOiBOdW1iZXIgb2YgZnVsbF9yZWFkcyA0MjUsIHNob3J0IHJlYWRz
IDEwLCB6ZXJvIGxlbiByZWFkcyAwLCBFQUdBSU4ocykgMTAwCnByZWFkdjIwMy5jOjE4MDogSU5G
TzogTnVtYmVyIG9mIHdyaXRlcyAzMDAKcHJlYWR2MjAzLmM6MTk0OiBJTkZPOiBDYWNoZSBkcm9w
cGVkIDEgdGltZXMKcHJlYWR2MjAzLmM6MjIzOiBQQVNTOiBHb3Qgc29tZSBFQUdBSU4KdHN0X3Rl
c3QuYzoxMjc4OiBJTkZPOiBUZXN0aW5nIG9uIGV4dDQKdHN0X2RldmljZS5jOjM0ODogV0FSTjog
RmFpbGVkIHRvIGNsZWFyIDUxMmsgYmxvY2sgb24gL2Rldi9sb29wMAp0c3RfbWtmcy5jOjg3OiBC
Uk9LOiB0c3RfY2xlYXJfZGV2aWNlKCkgZmFpbGVkCgpTdW1tYXJ5OgpwYXNzZWQgICAyCmZhaWxl
ZCAgIDAKc2tpcHBlZCAgMAp3YXJuaW5ncyAxCgpidXQgSSBoYXZlbid0IGJlZW4gYWJsZSB0byBy
ZWxpYWJseSByZXByb2R1Y2UgaXQgc28gZmFyLgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

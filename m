Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E117AB01
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 17:56:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB0D83C6536
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 17:56:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D834B3C6515
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 17:56:10 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4F4341402C68
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 17:56:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583427368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9SivJVu+fQ+64T5Hjkz3v1ZMb9dZxIa2r8KbXyL5Gs=;
 b=H2dxin9yQGfUJRRB7bOW6Xd/5iyJoykYC3XUv787pGX+F9G7V2Rw7uli9I9VlwoTVk5uQz
 1uIV2aSMHYi+MrOS2O35LlPB+jMpdy7doVJSb5iLtOhhxGTg/JdDQwRHsDCz20jlRq23J2
 mD3/0yHMNUYG+rQjKGj6Evreu9OrtL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-esYLcx6_MO-QYNtXYagVUA-1; Thu, 05 Mar 2020 11:56:03 -0500
X-MC-Unique: esYLcx6_MO-QYNtXYagVUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0042DB62;
 Thu,  5 Mar 2020 16:56:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9567F272C4;
 Thu,  5 Mar 2020 16:56:02 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83E8186A04;
 Thu,  5 Mar 2020 16:56:02 +0000 (UTC)
Date: Thu, 5 Mar 2020 11:56:02 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>, 
 Linux Stable maillist <stable@vger.kernel.org>
Message-ID: <173385062.10432633.1583427362328.JavaMail.zimbra@redhat.com>
In-Reply-To: <2065777364.10425170.1583425488638.JavaMail.zimbra@redhat.com>
References: <cki.EED856DF66.LLEP90YP5M@redhat.com>
 <2065777364.10425170.1583425488638.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.1]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.5.7-60528b7.cki (stable-queue)
Thread-Index: kkuOJFuqhkSqHy2lWMvJx4dG0KzmcTW74Dzw
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E5?=
 =?utf-8?q?=2E7-60528b7=2Ecki_=28stable-queue=29?=
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVz
c2FnZSAtLS0tLQo+ID4gCj4gPiBIZWxsbywKPiA+IAo+ID4gV2UgcmFuIGF1dG9tYXRlZCB0ZXN0
cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0cmVlOgo+ID4gCj4gPiAgICAg
ICAgS2VybmVsIHJlcG86Cj4gPiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQKPiA+ICAgICAgICAg
ICAgIENvbW1pdDogNjA1MjhiNzllMzBhIC0ga3ZtOiBuVk1YOiBWTVdSSVRFIGNoZWNrcyB1bnN1
cHBvcnRlZAo+ID4gICAgICAgICAgICAgZmllbGQgYmVmb3JlIHJlYWQtb25seSBmaWVsZAo+ID4g
Cj4gPiBUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJl
bG93Lgo+ID4gCj4gPiAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVs
b3cpCj4gPiAgICAgICAgICAgICAgTWVyZ2U6IE9LCj4gPiAgICAgICAgICAgIENvbXBpbGU6IE9L
Cj4gPiAgICAgICAgICAgICAgVGVzdHM6IEZBSUxFRAo+ID4gCj4gPiBBbGwga2VybmVsIGJpbmFy
aWVzLCBjb25maWcgZmlsZXMsIGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkCj4g
PiBoZXJlOgo+ID4gCj4gPiAgIGh0dHBzOi8vY2tpLWFydGlmYWN0cy5zMy51cy1lYXN0LTIuYW1h
em9uYXdzLmNvbS9pbmRleC5odG1sP3ByZWZpeD1kYXRhd2FyZWhvdXNlLzIwMjAvMDMvMDQvNDcx
NTA1Cj4gPiAKPiA+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4gPiAKPiA+ICAg
ICBzMzkweDoKPiA+ICAgICAg4p2MIExUUAo+IAo+IEFsbCBpbnN0YW5jZXMgb2Ygc2ltaWxhciBw
YW5pY3MgWzFdIG1hbmlmZXN0IG1vc3RseSBvbiBzMzkwIGFuZCBhdAo+IGZpcnN0IGdsYW5jZSBs
b29rIGxpa2UgbWVtb3J5IGNvcnJ1cHRpb25zLgo+IAo+IEknbSBsb29raW5nIHRvIGNvbmZpcm0s
IHdoZXRoZXIgdGhpcyBoYXMgYmVlbiBmaXhlZCBieToKPiAKPiAgIGNvbW1pdCA2ZmNjYTBmYTQ4
MTE4ZTZkNjM3MzNlYjQ2NDRjNmNkODgwYzE1YjhmCj4gICBBdXRob3I6IFN1cmVuIEJhZ2hkYXNh
cnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cj4gICBEYXRlOiAgIE1vbiBGZWIgMyAxMzoyMjoxNiAy
MDIwIC0wODAwCj4gCj4gICAgIHNjaGVkL3BzaTogRml4IE9PQiB3cml0ZSB3aGVuIHdyaXRpbmcg
MCBieXRlcyB0byBQU0kgZmlsZXMKCkl0J3MgdW5yZWxhdGVkLiBUaGUgdGVzdCBkb2VzIHJlYWQs
IG5vdCB3cml0ZS4KCjUuNi4wLTAucmMzIGNyYXNoZWQgYXMgd2VsbC4gT24gczM5MHggSSdtIHVz
aW5nIGl0J3MgZW5vdWdoIHRvCiJjYXQgL3N5cy9mcy9jZ3JvdXAvY3B1LnByZXNzdXJlIiB0byB0
cmlnZ2VyLgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK

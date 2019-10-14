Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF04D5C7B
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 09:29:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57FC63C234D
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 09:29:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 26BAA3C14EE
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 09:29:02 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6E36B1000A9E
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 09:29:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F246308FC4D;
 Mon, 14 Oct 2019 07:28:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53F025DA2C;
 Mon, 14 Oct 2019 07:28:59 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BE654EA6E;
 Mon, 14 Oct 2019 07:28:59 +0000 (UTC)
Date: Mon, 14 Oct 2019 03:28:59 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>, andreyknvl@google.com, 
 LTP List <ltp@lists.linux.it>
Message-ID: <805988176.6044584.1571038139105.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.B4A567748F.PFM8G4WKXI@redhat.com>
References: <cki.B4A567748F.PFM8G4WKXI@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.7]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.4.0-rc2-d6c2c23.cki (stable-next)
Thread-Index: I1iuqhveSXTk+4892N8PIoGCTDH8iQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 14 Oct 2019 07:28:59 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E0-rc2-d6c2c23=2Ecki_=28stable-next=29?=
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
Cc: Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gSGVsbG8sCj4gCj4gV2UgcmFuIGF1
dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0cmVlOgo+
IAo+ICAgICAgICBLZXJuZWwgcmVwbzoKPiAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3Nhc2hhbC9saW51eC1zdGFibGUuZ2l0Cj4gICAgICAgICAg
ICAgQ29tbWl0OiBkNmMyYzIzYTI5ZjQgLSBNZXJnZSBicmFuY2ggJ3N0YWJsZS1uZXh0JyBvZgo+
ICAgICAgICAgICAgIHNzaDovL2NodWJieWJveDovaG9tZS9zYXNoYS9kYXRhL25leHQgaW50byBz
dGFibGUtbmV4dAo+IAo+IFRoZSByZXN1bHRzIG9mIHRoZXNlIGF1dG9tYXRlZCB0ZXN0cyBhcmUg
cHJvdmlkZWQgYmVsb3cuCj4gCj4gICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNlZSBkZXRh
aWxzIGJlbG93KQo+ICAgICAgICAgICAgICBNZXJnZTogT0sKPiAgICAgICAgICAgIENvbXBpbGU6
IE9LCj4gICAgICAgICAgICAgIFRlc3RzOiBGQUlMRUQKPiAKPiBBbGwga2VybmVsIGJpbmFyaWVz
LCBjb25maWcgZmlsZXMsIGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkIGhlcmU6
Cj4gCj4gICBodHRwczovL2FydGlmYWN0cy5ja2ktcHJvamVjdC5vcmcvcGlwZWxpbmVzLzIyMzU2
Mwo+IAo+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4gCj4gICAgIGFhcmNoNjQ6
Cj4gICAgICAg4p2MIExUUDogb3BlbnBvc2l4IHRlc3Qgc3VpdGUKPiAKClRlc3QgWzFdIGlzIHBh
c3NpbmcgdmFsdWUgY2xvc2UgdG8gTE9OR19NQVgsIHdoaWNoIG9uIGFybTY0IGlzIG5vdyB0cmVh
dGVkIGFzIHRhZ2dlZCB1c2Vyc3BhY2UgcHRyOgogIDA1N2QzMzg5MTA4ZSAoIm1tOiB1bnRhZyB1
c2VyIHBvaW50ZXJzIHBhc3NlZCB0byBtZW1vcnkgc3lzY2FsbHMiKQoKQW5kIG5vdyBzZWVtcyB0
byBoaXQgb3ZlcmZsb3cgY2hlY2sgYWZ0ZXIgc2lnbiBleHRlbnNpb24gKEVJTlZBTCkuClRlc3Qg
c2hvdWxkIHByb2JhYmx5IGZpbmQgZGlmZmVyZW50IHdheSB0byBjaG9vc2UgaW52YWxpZCBwb2lu
dGVyLgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL2Jsb2Iv
bWFzdGVyL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9jb25mb3JtYW5jZS9pbnRlcmZh
Y2VzL21sb2NrLzgtMS5jCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==

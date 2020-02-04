Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A1447151751
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 10:03:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A61D3C24C8
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 10:03:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 615B33C0EB6
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 10:03:04 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5361A200FD1
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 10:03:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580806981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgbQWepxvZEKVjhljUIgxQZLJyyhLVVP/zdUzW5X4U0=;
 b=MfvTxxsri/oidRYQjc+sEc/XQB7YlgoHBMSy3O10Sw8hJeZXKZi0tyYzWqmzvaW3v6brjA
 uGoKJF2/+S5QtLQM5m3Y/XTauZlCx0Ltf56xWNaw1wmuKP5z0SP6bYtvsGUBiofQcR8MM4
 ciP4t3wuXWeUkWczScoM/TG2oWG4vOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-cuqg0jjXPV2LC1SQt4jJ4w-1; Tue, 04 Feb 2020 04:02:53 -0500
X-MC-Unique: cuqg0jjXPV2LC1SQt4jJ4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 135F885EE6F;
 Tue,  4 Feb 2020 09:02:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BADE5DA83;
 Tue,  4 Feb 2020 09:02:51 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25E861809563;
 Tue,  4 Feb 2020 09:02:51 +0000 (UTC)
Date: Tue, 4 Feb 2020 04:02:50 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>
Message-ID: <1905459596.5574249.1580806970915.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.A43C5F6701.3LH2WNZUVM@redhat.com>
References: <cki.A43C5F6701.3LH2WNZUVM@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.11]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.4.18-rc1-6213eed.cki (stable)
Thread-Index: lsdpAyQ4GSnbyv+nGAm45PURpUkWDA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E18-rc1-6213eed=2Ecki_=28stable=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, Jaroslav Kysela <jkysela@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>,
 Linux Stable maillist <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gSGVsbG8sCj4gCj4gV2UgcmFuIGF1
dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0cmVlOgo+
IAo+ICAgICAgICBLZXJuZWwgcmVwbzoKPiAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0Cj4gICAgICAg
ICAgICAgQ29tbWl0OiA2MjEzZWVkMGU0NDQgLSBMaW51eCA1LjQuMTgtcmMxCj4gCj4gVGhlIHJl
c3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4KPiAKPiAg
ICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCj4gICAgICAgICAg
ICAgIE1lcmdlOiBPSwo+ICAgICAgICAgICAgQ29tcGlsZTogT0sKPiAgICAgICAgICAgICAgVGVz
dHM6IEZBSUxFRAo+IAo+IEFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxlcywgYW5kIGxv
Z3MgYXJlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQgaGVyZToKPiAKPiAgIGh0dHBzOi8vYXJ0aWZh
Y3RzLmNraS1wcm9qZWN0Lm9yZy9waXBlbGluZXMvNDE5MDkxCj4gCj4gT25lIG9yIG1vcmUga2Vy
bmVsIHRlc3RzIGZhaWxlZDoKPiAKPiAgICAgcHBjNjRsZToKPiAgICAgIOKdjCBMVFAKCmI0NWQ4
MmNmYmFiYyAoIm1heF9tYXBfY291bnQ6IHVzZSBkZWZhdWx0IG92ZXJjb21taXQgbW9kZSIpCnNo
b3VsZCBhZGRyZXNzIHRoYXQuIENLSSBqb2IgaXMgY3VycmVudGx5IGF0IExUUCBjb21taXQ6CiAg
YmFmNGNhMTY1M2E5ICgic3lzY2FsbHMvY2Fwc2V0MDE6IENsZWFudXAgJiBjb252ZXJ0IHRvIG5l
dyBsaWJyYXJ5IikKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087D152033
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 19:06:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85DF83C2542
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 19:06:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 670F33C23F8
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 19:06:53 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 185ED100158A
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 19:06:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580839610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWKVifPvzk7nGZkW2Rkc9lnH/1uQ5csPYFLkasrtOuc=;
 b=ZJ0fy2TZ5/uNYUNcvgSjirCYJkhbFy8IvrMPiI2d2F9TBc509s7UW7bGgVC1OS93UGBjWN
 dL/X0GMRkUQfMiMqwYgeO7c8oO241tZPBV6AFATzXgsi6DhBYY+lyqC3qOtuUeqKst/Ir/
 Kb4HENY5vYY5Uo9PnMUFkO98bKbBtsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-PGVruzOkOEWd4QzH82xiKA-1; Tue, 04 Feb 2020 13:06:35 -0500
X-MC-Unique: PGVruzOkOEWd4QzH82xiKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ECDC8014CE;
 Tue,  4 Feb 2020 18:06:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-121-102.rdu2.redhat.com
 [10.10.121.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FE9B87EFF;
 Tue,  4 Feb 2020 18:06:28 +0000 (UTC)
To: Jan Stancek <jstancek@redhat.com>, CKI Project <cki-project@redhat.com>
References: <cki.A43C5F6701.3LH2WNZUVM@redhat.com>
 <1905459596.5574249.1580806970915.JavaMail.zimbra@redhat.com>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <fd899990-b29d-7b5d-208c-aa89e5d67859@redhat.com>
Date: Tue, 4 Feb 2020 13:06:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1905459596.5574249.1580806970915.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: Linux Stable maillist <stable@vger.kernel.org>,
 Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 Jaroslav Kysela <jkysela@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpPbiAyLzQvMjAgNDowMiBBTSwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4gCj4gCj4gLS0tLS0gT3Jp
Z2luYWwgTWVzc2FnZSAtLS0tLQo+Pgo+PiBIZWxsbywKPj4KPj4gV2UgcmFuIGF1dG9tYXRlZCB0
ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0cmVlOgo+Pgo+PiAgICAg
ICAgIEtlcm5lbCByZXBvOgo+PiAgICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdAo+PiAgICAgICAgICAg
ICAgQ29tbWl0OiA2MjEzZWVkMGU0NDQgLSBMaW51eCA1LjQuMTgtcmMxCj4+Cj4+IFRoZSByZXN1
bHRzIG9mIHRoZXNlIGF1dG9tYXRlZCB0ZXN0cyBhcmUgcHJvdmlkZWQgYmVsb3cuCj4+Cj4+ICAg
ICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCj4+ICAgICAgICAg
ICAgICAgTWVyZ2U6IE9LCj4+ICAgICAgICAgICAgIENvbXBpbGU6IE9LCj4+ICAgICAgICAgICAg
ICAgVGVzdHM6IEZBSUxFRAo+Pgo+PiBBbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcgZmlsZXMs
IGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkIGhlcmU6Cj4+Cj4+ICAgIGh0dHBz
Oi8vYXJ0aWZhY3RzLmNraS1wcm9qZWN0Lm9yZy9waXBlbGluZXMvNDE5MDkxCj4+Cj4+IE9uZSBv
ciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4+Cj4+ICAgICAgcHBjNjRsZToKPj4gICAgICAg
4p2MIExUUAo+IAo+IGI0NWQ4MmNmYmFiYyAoIm1heF9tYXBfY291bnQ6IHVzZSBkZWZhdWx0IG92
ZXJjb21taXQgbW9kZSIpCj4gc2hvdWxkIGFkZHJlc3MgdGhhdC4gQ0tJIGpvYiBpcyBjdXJyZW50
bHkgYXQgTFRQIGNvbW1pdDoKPiAgICBiYWY0Y2ExNjUzYTkgKCJzeXNjYWxscy9jYXBzZXQwMTog
Q2xlYW51cCAmIGNvbnZlcnQgdG8gbmV3IGxpYnJhcnkiKQoKVGhhbmtzIGZvciB0aGUgcmVtaW5k
ZXIgOi0pIEkgd2lsbCB1cGRhdGUgTFRQIHRvIGEgcmVjZW50IGNvbW1pdCB0b2RheSB0byBwdWxs
CmluIHRoaXMgY2hhbmdlLgoKLVJhY2hlbAo+IAo+IAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

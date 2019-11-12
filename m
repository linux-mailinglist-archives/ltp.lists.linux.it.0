Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C2F8C4E
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 10:56:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36E3C3C24C8
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 10:56:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 793463C2497
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 10:56:17 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 1AEC96026FA
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 10:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573552574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rXA6SugEQiC4KhkH3JoUgHbc8fbEDq4RWmq1iZgjtQ=;
 b=ZsYcBhsxPNF/J1D1lYk/i/BggYupXd39qnoZRpSGDLumvzm4122GrNBeZooVjI2TTBueiV
 SZOoPnngN0VSK1cTXt2KjlASXeLKJDlV4Vjyf2JBw15PXD3zk3zfvaLqZgv5LKH5kO7aSK
 atkvx/EXj7QO1oBXIQ8l7p4NYYZp+3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-Ys7QsLH7ObSaQPrFSE5_4A-1; Tue, 12 Nov 2019 04:56:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BAA91800D63
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 09:56:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 745503DBB
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 09:56:12 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A3D14BB5B;
 Tue, 12 Nov 2019 09:56:12 +0000 (UTC)
Date: Tue, 12 Nov 2019 04:56:12 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Message-ID: <976393725.11648955.1573552572246.JavaMail.zimbra@redhat.com>
In-Reply-To: <232041279.11531466.1573491604178.JavaMail.zimbra@redhat.com>
References: <cki.ECB352932E.9FL0Q68EC2@redhat.com>
 <232041279.11531466.1573491604178.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.1]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.4.0-rc6-dd89262.cki (mainline.kernel.org)
Thread-Index: 0x4WtJjb3fW4L68Mg1pxbC5b5At2dXisRfZy
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Ys7QsLH7ObSaQPrFSE5_4A-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E0-rc6-dd89262=2Ecki_=28mainline=2Ekernel=2Eorg=29?=
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
Cc: Memory Management <mm-qe@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2Fn
ZSAtLS0tLQo+ID4gICAgICDinYwgTFRQIGxpdGUKPiAKPiBwZXJmX2V2ZW50X29wZW4wMiBhZ2Fp
bjoKCkkgaGF2ZSBhIHN5c3RlbSBbMV0gd2hlcmUgaXQncyBjb25zaXN0ZW50bHkgcmVwcm9kdWNp
YmxlLgpJdCBsb29rcyBsaWtlIGNvdW50X2hhcmR3YXJlX2NvdW50ZXJzKCkgcmVwb3J0cyBpbmNv
cnJlY3QgbnVtYmVyLgp0aW1lX2VuYWJsZWQgYW5kIHRpbWVfcnVubmluZyBhcmUgZGlmZmVyZW50
IGJ1dCBvbmx5IGJhcmVseSAofjAuNyUpLgoKIyAuL3BlcmZfZXZlbnRfb3BlbjAyIC12CmF0IGl0
ZXJhdGlvbjowIHZhbHVlOjMwMDM1Nzg5MyB0aW1lX2VuYWJsZWQ6NTUzNjg2MDggdGltZV9ydW5u
aW5nOjU1MzY4NjA4CmF0IGl0ZXJhdGlvbjoxIHZhbHVlOjYwMDcxMjQ5OCB0aW1lX2VuYWJsZWQ6
NTQ4MDgxNzkgdGltZV9ydW5uaW5nOjU0NDAzMTQ4CnBlcmZfZXZlbnRfb3BlbjAyICAgIDAgIFRJ
TkZPICA6ICBvdmVyYWxsIHRhc2sgY2xvY2s6IDU0ODI1OTMxCnBlcmZfZXZlbnRfb3BlbjAyICAg
IDAgIFRJTkZPICA6ICBodyBzdW06IDE0NDI1Mzg2MjAsIHRhc2sgY2xvY2sgc3VtOiAyNjA5MTkz
NDIKaHcgY291bnRlcnM6IDI4ODUwNzcyNCAyODg1MDc3MjQgMjg4NTA3NzI0IDI4ODUwNzcyNCAy
ODg1MDc3MjQKdGFzayBjbG9jayBjb3VudGVyczogNTE3NzMwNDcgNTI1MjY2NjQgNTI1MzE2OTQg
NTI1NDAzODYgNTE1NDc1NTEKcGVyZl9ldmVudF9vcGVuMDIgICAgMCAgVElORk8gIDogIHJhdGlv
OiA0Ljc1OTA1MApwZXJmX2V2ZW50X29wZW4wMiAgICAxICBURkFJTCAgOiAgcGVyZl9ldmVudF9v
cGVuMDIuYzozOTQ6IHRlc3QgZmFpbGVkIChyYXRpbyB3YXMgZ3JlYXRlciB0aGFuICkKCkFsc28g
ZG9fd29yaygpIGNvbXBsZXRlcyBwcmV0dHkgZmFzdCBjb21wYXJlZCB0byBhIGRpZmZlcmVudCBo
b3N0OgoKcmVhbAkwbTAuMTc2cwp1c2VyCTBtMC4xNjNzCnN5cwkwbTAuMDAzcwoKWzFdCiMgbHNj
cHUgCkFyY2hpdGVjdHVyZTogICAgICAgICAgICAgICAgICAgIHg4Nl82NApDUFUgb3AtbW9kZShz
KTogICAgICAgICAgICAgICAgICAzMi1iaXQsIDY0LWJpdApCeXRlIE9yZGVyOiAgICAgICAgICAg
ICAgICAgICAgICBMaXR0bGUgRW5kaWFuCkFkZHJlc3Mgc2l6ZXM6ICAgICAgICAgICAgICAgICAg
IDM2IGJpdHMgcGh5c2ljYWwsIDQ4IGJpdHMgdmlydHVhbApDUFUocyk6ICAgICAgICAgICAgICAg
ICAgICAgICAgICA0Ck9uLWxpbmUgQ1BVKHMpIGxpc3Q6ICAgICAgICAgICAgIDAtMwpUaHJlYWQo
cykgcGVyIGNvcmU6ICAgICAgICAgICAgICAyCkNvcmUocykgcGVyIHNvY2tldDogICAgICAgICAg
ICAgIDEKU29ja2V0KHMpOiAgICAgICAgICAgICAgICAgICAgICAgMgpOVU1BIG5vZGUocyk6ICAg
ICAgICAgICAgICAgICAgICAxClZlbmRvciBJRDogICAgICAgICAgICAgICAgICAgICAgIEdlbnVp
bmVJbnRlbApDUFUgZmFtaWx5OiAgICAgICAgICAgICAgICAgICAgICAxNQpNb2RlbDogICAgICAg
ICAgICAgICAgICAgICAgICAgICAzCk1vZGVsIG5hbWU6ICAgICAgICAgICAgICAgICAgICAgIElu
dGVsKFIpIFhlb24oVE0pIENQVSAzLjQwR0h6ClN0ZXBwaW5nOiAgICAgICAgICAgICAgICAgICAg
ICAgIDQKQ1BVIE1IejogICAgICAgICAgICAgICAgICAgICAgICAgMjgwMC4wMDAKQ1BVIG1heCBN
SHo6ICAgICAgICAgICAgICAgICAgICAgMzQwMC4wMDAwCkNQVSBtaW4gTUh6OiAgICAgICAgICAg
ICAgICAgICAgIDI4MDAuMDAwMApCb2dvTUlQUzogICAgICAgICAgICAgICAgICAgICAgICA2ODAw
LjYyCkwxZCBjYWNoZTogICAgICAgICAgICAgICAgICAgICAgIDMyIEtpQgpMMiBjYWNoZTogICAg
ICAgICAgICAgICAgICAgICAgICAyIE1pQgpOVU1BIG5vZGUwIENQVShzKTogICAgICAgICAgICAg
ICAwLTMKVnVsbmVyYWJpbGl0eSBMMXRmOiAgICAgICAgICAgICAgTWl0aWdhdGlvbjsgUFRFIElu
dmVyc2lvbgpWdWxuZXJhYmlsaXR5IE1kczogICAgICAgICAgICAgICBWdWxuZXJhYmxlOiBDbGVh
ciBDUFUgYnVmZmVycyBhdHRlbXB0ZWQsIG5vIG1pY3JvY29kZTsgU01UIHZ1bG5lcmFibGUKVnVs
bmVyYWJpbGl0eSBNZWx0ZG93bjogICAgICAgICAgTWl0aWdhdGlvbjsgUFRJClZ1bG5lcmFiaWxp
dHkgU3BlYyBzdG9yZSBieXBhc3M6IFZ1bG5lcmFibGUKVnVsbmVyYWJpbGl0eSBTcGVjdHJlIHYx
OiAgICAgICAgTWl0aWdhdGlvbjsgdXNlcmNvcHkvc3dhcGdzIGJhcnJpZXJzIGFuZCBfX3VzZXIg
cG9pbnRlciBzYW5pdGl6YXRpb24KVnVsbmVyYWJpbGl0eSBTcGVjdHJlIHYyOiAgICAgICAgTWl0
aWdhdGlvbjsgRnVsbCBnZW5lcmljIHJldHBvbGluZSwgU1RJQlAgZGlzYWJsZWQsIFJTQiBmaWxs
aW5nCkZsYWdzOiAgICAgICAgICAgICAgICAgICAgICAgICAgIGZwdSB2bWUgZGUgcHNlIHRzYyBt
c3IgcGFlIG1jZSBjeDggYXBpYyBzZXAgbXRyciBwZ2UgbWNhIGNtb3YgcGF0IHBzZTM2IGNsZmx1
c2ggZHRzIGFjcGkgbW14IGZ4c3Igc3NlIHNzZTIgc3MgaHQgdG0gcGJlIHN5c2NhbGwgbG0gY29u
c3RhbnRfdHNjIHBlYnMgYnRzIG5vcGwgY3B1aQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkIHBuaSBkdGVzNjQgbW9uaXRvciBkc19jcGwgZXN0IHRtMiBjaWQgeHRwciBwdGkKCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==

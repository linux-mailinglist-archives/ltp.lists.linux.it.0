Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D651F795C
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 18:00:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BB633C1840
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 18:00:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6373E3C17A2
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 18:00:09 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 910E060242B
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 18:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573491606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYDYldJ30XxNR8zzp+lYb2Ip5vtGlDXgZcI0d1UYVwQ=;
 b=NJ52vobNMp5i2Fv3rTNpTmn7MJdsrXiAFVA0yn2QQx0KKq0x0F7vYPQ0X0jLR6ZnHq3jLy
 ZV/9KCL7x28K2Xm7/4LJD+2eyllgrLQB4xfVzJOuaky/m/IFs2Bue1pjifF3x9WkBBTm9z
 LZAdV4hJ0xngjJirqo8eps1kdrLjcUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-4GNFgtV4NOeVSAcy6XUCCA-1; Mon, 11 Nov 2019 12:00:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 672E7107ACC7
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 17:00:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56627610B0
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 17:00:04 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D642183269C;
 Mon, 11 Nov 2019 17:00:04 +0000 (UTC)
Date: Mon, 11 Nov 2019 12:00:04 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Message-ID: <232041279.11531466.1573491604178.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.ECB352932E.9FL0Q68EC2@redhat.com>
References: <cki.ECB352932E.9FL0Q68EC2@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.13]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.4.0-rc6-dd89262.cki (mainline.kernel.org)
Thread-Index: 0x4WtJjb3fW4L68Mg1pxbC5b5At2dQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 4GNFgtV4NOeVSAcy6XUCCA-1
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
Cc: Memory Management <mm-qe@redhat.com>, Milos Malik <mmalik@redhat.com>,
 Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiAgICAgIOKdjCBMVFAgbGl0ZQoKcGVyZl9l
dmVudF9vcGVuMDIgYWdhaW46Cgo8PDx0ZXN0X3N0YXJ0Pj4+CnRhZz1wZXJmX2V2ZW50X29wZW4w
MiBzdGltZT0xNTczNDM0Mzk4CmNtZGxpbmU9InBlcmZfZXZlbnRfb3BlbjAyIgpjb250YWN0cz0i
IgphbmFseXNpcz1leGl0Cjw8PHRlc3Rfb3V0cHV0Pj4+CnBlcmZfZXZlbnRfb3BlbjAyICAgIDAg
IFRJTkZPICA6ICBvdmVyYWxsIHRhc2sgY2xvY2s6IDU0MTcyOTgwCnBlcmZfZXZlbnRfb3BlbjAy
ICAgIDAgIFRJTkZPICA6ICBodyBzdW06IDE0MjMzNDE0MTAsIHRhc2sgY2xvY2sgc3VtOiAyNTUy
ODk5MTMKcGVyZl9ldmVudF9vcGVuMDIgICAgMCAgVElORk8gIDogIHJhdGlvOiA0LjcxMjQ5NQpw
ZXJmX2V2ZW50X29wZW4wMiAgICAxICBURkFJTCAgOiAgcGVyZl9ldmVudF9vcGVuMDIuYzozOTQ6
IHRlc3QgZmFpbGVkIChyYXRpbyB3YXMgZ3JlYXRlciB0aGFuICkKPDw8ZXhlY3V0aW9uX3N0YXR1
cz4+Pgppbml0aWF0aW9uX3N0YXR1cz0ib2siCmR1cmF0aW9uPTAgdGVybWluYXRpb25fdHlwZT1l
eGl0ZWQgdGVybWluYXRpb25faWQ9MSBjb3JlZmlsZT1ubwpjdXRpbWU9MTcgY3N0aW1lPTAKPDw8
dGVzdF9lbmQ+Pj4KCkkgcmFuIGl0IGJ5IGhhbmQgb24gc2FtZSBzeXN0ZW0gd2l0aCBzYW1lIGtl
cm5lbC4gSXQncyBnaXZpbmcgcmF0aW8gY2xvc2UgdG8gOQpmb3IgcGFzdCBjb3VwbGUgaG91cnM6
CgpwZXJmX2V2ZW50X29wZW4wMiAgICAwICBUSU5GTyAgOiAgb3ZlcmFsbCB0YXNrIGNsb2NrOiAz
MjgyOTMxNwpwZXJmX2V2ZW50X29wZW4wMiAgICAwICBUSU5GTyAgOiAgaHcgc3VtOiAyNzAxNjcz
OTczLCB0YXNrIGNsb2NrIHN1bTogMjk1MDg1NjI4CnBlcmZfZXZlbnRfb3BlbjAyICAgIDAgIFRJ
TkZPICA6ICByYXRpbzogOC45ODg0NzkKcGVyZl9ldmVudF9vcGVuMDIgICAgMSAgVFBBU1MgIDog
IHRlc3QgcGFzc2VkCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=

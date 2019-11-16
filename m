Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B14FEC20
	for <lists+linux-ltp@lfdr.de>; Sat, 16 Nov 2019 12:56:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF0313C2497
	for <lists+linux-ltp@lfdr.de>; Sat, 16 Nov 2019 12:56:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C49253C1CBB
 for <ltp@lists.linux.it>; Sat, 16 Nov 2019 12:56:45 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 2CFEE2011B2
 for <ltp@lists.linux.it>; Sat, 16 Nov 2019 12:56:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573905403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tALrAblEWz8ynJbClK3UAV8FqncljVF7abiRV6ku2Y=;
 b=PCLT/MV4QQW0KcTPjxSplxGivMXkRKEC6delj6QgZsmOtgNPXa7o+zyqyGR78B9ik3niOF
 Rrbz1zDeBMeEFV9JNP3/+nCUbuH5z+bcdAnVnZlpaja/zrQuK08pqMLNZW7CTTwpEGm+lA
 sojtcIGWoAfC6CLxcgEfjtIugCbVH6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-qX-VxG8nMpmepy3IWml3vw-1; Sat, 16 Nov 2019 06:56:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 718F78048E6
 for <ltp@lists.linux.it>; Sat, 16 Nov 2019 11:56:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6892A60F8B
 for <ltp@lists.linux.it>; Sat, 16 Nov 2019 11:56:40 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24E8618095FF;
 Sat, 16 Nov 2019 11:56:40 +0000 (UTC)
Date: Sat, 16 Nov 2019 06:56:39 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>
Message-ID: <1833930614.12688158.1573905399800.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.492ED7396B.CQPXHDBTDS@redhat.com>
References: <cki.492ED7396B.CQPXHDBTDS@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.45, 10.4.195.26]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.4.0-rc7-875fef4.cki (mainline.kernel.org)
Thread-Index: sRzii+2DfDg8K5fpar1voX71dViuKg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: qX-VxG8nMpmepy3IWml3vw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E0-rc7-875fef4=2Ecki_=28mainline=2Ekernel=2Eorg=29?=
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiAKPiBIZWxsbywKPiAKPiBXZSByYW4gYXV0
b21hdGVkIHRlc3RzIG9uIGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMga2VybmVsIHRyZWU6Cj4g
Cj4gICAgICAgIEtlcm5lbCByZXBvOgo+ICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQKPiAgICAgICAgICAgICBD
b21taXQ6IDg3NWZlZjQ5M2YyMSAtIE1lcmdlIHRhZyAnY2VwaC1mb3ItNS40LXJjOCcgb2YKPiAg
ICAgICAgICAgICBnaXQ6Ly9naXRodWIuY29tL2NlcGgvY2VwaC1jbGllbnQKPiAKPiBUaGUgcmVz
dWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93Lgo+IAo+ICAg
ICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiAgICAgICAgICAg
ICAgTWVyZ2U6IE9LCj4gICAgICAgICAgICBDb21waWxlOiBPSwo+ICAgICAgICAgICAgICBUZXN0
czogRkFJTEVECj4gCj4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9n
cyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZCBoZXJlOgo+IAo+ICAgaHR0cHM6Ly9hcnRpZmFj
dHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8yODc4NDQKPiAKPiBPbmUgb3IgbW9yZSBrZXJu
ZWwgdGVzdHMgZmFpbGVkOgo+IAo+ICAgICB4ODZfNjQ6Cj4gICAgICDinYwgTFRQIGxpdGUKCkBD
S0k6IFlvdSBzaG91bGQgdXBkYXRlIHlvdXIgTFRQLCBpbiBuZXcgb25lIHRoaXMgdGVzdCBza2lw
cyBkZWJ1Z2ZzLgoKSSBkaWRuJ3QgZ2V0IHJlcG9ydGVkIGNyYXNoIFsxXSwgYnV0IGZpbGUgYmVs
b3cgc2VlbXMgdG8gaGF2ZSBwb3RlbnRpYWwgZm9yIHRoYXQ6CgojIGNhdCAvc3lzL2tlcm5lbC9k
ZWJ1Zy9kZXZpY2VfY29tcG9uZW50L21laTo6YjYzOGFiN2UtOTRlMi00ZWEyLWE1NTItZDFjNTRi
NjI3ZjA0OjAxCm1hc3RlciBuYW1lICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdGF0dXMKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQptZWk6OmI2MzhhYjdlLTk0ZTItNGVhMi1hNTUyLWQxYzU0YjYy
N2YwNDowMSAgICAgICAgICAgIG5vdCBib3VuZAoKZGV2aWNlIG5hbWUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cwotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCu+/vQrvv73vv73vv73vv73v
v73vv73vv73vv73vv70odwogICAgICAgICAgIO+/ve+/ve+/ve+/vTDvv71P77+977+977+977+9
ICAgICAgICAgICAgICBub3QgcmVnaXN0ZXJlZAoKClsxXQpbIDU4MTIuNjI1OTk0XSBnZW5lcmFs
IHByb3RlY3Rpb24gZmF1bHQ6IDAwMDAgWyMxXSBTTVAgUFRJIApbIDU4MTIuNjMyNzg3XSBDUFU6
IDMgUElEOiA0NDEyMjEgQ29tbTogcmVhZF9hbGwgTm90IHRhaW50ZWQgNS40LjAtcmM3LTg3NWZl
ZjQuY2tpICMxIApbIDU4MTIuNjQyMDEyXSBIYXJkd2FyZSBuYW1lOiBJbnRlbCBDb3Jwb3JhdGlv
biBTYW5keUJyaWRnZSBQbGF0Zm9ybS9Mb3NMdW5hcyBDUkIsIEJJT1MgQVNOQkNQVDEuODZDLjAw
NjEuUDAwLjExMDExMzExMTAgMDEvMTMvMjAxMSAKWyA1ODEyLjY1NTQ1Ml0gUklQOiAwMDEwOnN0
cmluZ19ub2NoZWNrKzB4MzQvMHg1MCAKWyA1ODEyLjY2MTQzMF0gQ29kZTogNjYgODUgYzAgNzQg
M2MgODMgZTggMDEgNGMgOGQgNWMgMDcgMDEgMzEgYzAgZWIgMTkgNDkgMzkgZmEgNzYgMDMgNDQg
ODggMDcgNDggODMgYzcgMDEgNDEgOGQgNzEgMDEgNDggODMgYzAgMDEgNGMgMzkgZGYgNzQgMGYg
PDQ0PiAwZiBiNiAwNCAwMiA0MSA4OSBjMSA4OSBjNiA0NSA4NCBjMCA3NSBkOCA0YyA4OSBkMiBl
OSAxNSBmZiBmZiAKWyA1ODEyLjY4Mzg2NF0gUlNQOiAwMDE4OmZmZmZhYzYzYTE2ZDdkMTggRUZM
QUdTOiAwMDAxMDI0NiAKWyA1ODEyLjY5MDY3NF0gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDog
ZmZmZmFjNjNhMTZkN2RiMCBSQ1g6IGZmZmYwYTAyMDAwMDI4MDQgClsgNTgxMi42OTk0NTldIFJE
WDogNjQ2NTZlNjk2NjZlNmY2MyBSU0k6IGZmZmY4OTBmODVlNDQwMDAgUkRJOiBmZmZmODkwZjg1
ZTQzMTNiIApbIDU4MTIuNzA4MjYzXSBSQlA6IGZmZmY4OTBmODVlNDQwMDAgUjA4OiBmZmZmZmZm
Zjk4MWJmYTM4IFIwOTogZmZmZjg5MGY4NWU0MzBlOCAKWyA1ODEyLjcxNzA2MV0gUjEwOiBmZmZm
ODkwZjg1ZTQ0MDAwIFIxMTogZmZmZjg5MTA4NWU0MzEzYSBSMTI6IDY0NjU2ZTY5NjY2ZTZmNjMg
ClsgNTgxMi43MjU3OTBdIFIxMzogZmZmZjBhMDIwMDAwMjgwNCBSMTQ6IDAwMDAwMDAwMDAwMDBl
YzUgUjE1OiBmZmZmZmZmZjk4MTZjZGY2IApbIDU4MTIuNzM0NTAzXSBGUzogIDAwMDA3ZjMxYTUz
NWY3NDAoMDAwMCkgR1M6ZmZmZjg5MGY4YjhjMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAw
MDAwIApbIDU4MTIuNzQ0MTYxXSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAw
MDAwMDgwMDUwMDMzIApbIDU4MTIuNzUxMzQ4XSBDUjI6IDAwMDA3ZmI2MGM5ODM2NDAgQ1IzOiAw
MDAwMDAwMTQyYzg4MDAzIENSNDogMDAwMDAwMDAwMDA2MDZlMCAKWyA1ODEyLjc1OTk3NF0gQ2Fs
bCBUcmFjZTogClsgNTgxMi43NjM2MzJdICBzdHJpbmcrMHg0Mi8weDUwIApbIDU4MTIuNzY3ODI5
XSAgdnNucHJpbnRmKzB4Mjc2LzB4NGYwIApbIDU4MTIuNzcyNDc4XSAgc2VxX3ZwcmludGYrMHgz
MC8weDUwIApbIDU4MTIuNzc3MTIyXSAgc2VxX3ByaW50ZisweDUzLzB4NzAgClsgNTgxMi43ODE2
ODJdICA/IGRvX2ZpbHBfb3BlbisweGE1LzB4MTAwIApbIDU4MTIuNzg2NzAxXSAgY29tcG9uZW50
X2RldmljZXNfc2hvdysweDEwMy8weDEyMCAKWyA1ODEyLjc5MjU1N10gIHNlcV9yZWFkKzB4Y2Qv
MHg0MDAgClsgNTgxMi43OTcwNTNdICBmdWxsX3Byb3h5X3JlYWQrMHg1My8weDgwIApbIDU4MTIu
ODAyMTEwXSAgdmZzX3JlYWQrMHg5ZC8weDE1MCAKWyA1ODEyLjgwNjYzMV0gIGtzeXNfcmVhZCsw
eDVmLzB4ZTAgClsgNTgxMi44MTExNDddICBkb19zeXNjYWxsXzY0KzB4NWIvMHgxODAgClsgNTgx
Mi44MTYxMThdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGE5IApbIDU4
MTIuODIyNTkwXSBSSVA6IDAwMzM6MHg3ZjMxYTU1M2U4NDIgClsgNTgxMi44Mjc1MDddIENvZGU6
IDk3IDAwIDAwIGY3IGQ4IDY0IDg5IDAyIDQ4IGM3IGMwIGZmIGZmIGZmIGZmIGViIGJlIDBmIDFm
IDgwIDAwIDAwIDAwIDAwIGYzIDBmIDFlIGZhIDY0IDhiIDA0IDI1IDE4IDAwIDAwIDAwIDg1IGMw
IDc1IDEwIDBmIDA1IDw0OD4gM2QgMDAgZjAgZmYgZmYgNzcgNTYgYzMgMGYgMWYgNDQgMDAgMDAg
NDggODMgZWMgMjggNDggODkgNTQgMjQgCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

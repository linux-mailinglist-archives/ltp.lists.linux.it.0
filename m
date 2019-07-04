Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F05CA5F10C
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 03:56:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C019E3C1DA5
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 03:56:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C05723C1D4F
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 03:56:16 +0200 (CEST)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 29C8E6021BF
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 03:56:13 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x641u7mx011008
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Wed, 3 Jul 2019 18:56:07 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 3 Jul 2019 18:56:07 -0700
To: Jan Stancek <jstancek@redhat.com>
References: <dc4e1e30-face-9039-db90-5a6dae2fc2ea@windriver.com>
 <1731168043.30655111.1561720172996.JavaMail.zimbra@redhat.com>
 <77f916ad-58e3-bf0c-e1e7-da8fc3397ba4@windriver.com>
 <818477200.31466413.1562158387201.JavaMail.zimbra@redhat.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <b3536126-309b-5641-aeb8-de36180a8395@windriver.com>
Date: Thu, 4 Jul 2019 09:56:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <818477200.31466413.1562158387201.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Bug Report: diotest4 fails on mips64
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ck9uIDcvMy8xOSA4OjUzIFBNLCBKYW4gU3RhbmNlayB3cm90ZToKPiAtLS0tLSBPcmlnaW5hbCBN
ZXNzYWdlIC0tLS0tCj4+IFRoYW5rcyBmb3IgeW91ciB3b3JrLgo+Pgo+PiBJIHdpbGwgYmFja3Bv
cnQgdGhlIHBhdGNoIHRvIG15IHByb2plY3QgYWZ0ZXIgbWVyZ2VkLgo+IERvZXMgaXQgbWVhbiwg
dGhhdCBwYXRjaCBJIHBvc3RlZCBmaXhlcyBwcm9ibGVtIGZvciB5b3U/CgoKTm90IGZvciBtZSwg
Zm9yIExUUC4KCkkganVzdCBmb3VuZCB0aGUgYnVnLiBFdmVuIGlmIHRoZXJlIGlzIG5vIG1lLCB0
aGUgYnVnIHN0aWxsIGV4aXN0cy4KCgpEbyB5b3UgdGhpbmsgdGhlIG1hbnVhbGx5IHNlbGVjdGlu
ZyBhZGRyIGZvciBtbWFwIGlzIHJlYXNvbmFibGU/CgpBbmQgdGhlIGFkZHIgcG9pbnRzIHRvIHRo
ZSB0b3Agb2YgaGVhcC4KCgp8ICA+c2htX2Jhc2UgPSAoY2hhciAqKSgoKGxvbmcpc2JyaygwKSAr
IChzaG1zeiAtIDEpKSAmIH4oc2htc3ogLSAxKSk7Cgp8wqAgPnNobV9iYXNlID0gbW1hcChzaG1f
YmFzZSwgMHgxMDAwMDAsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCgoKPgo+IERvIHlvdSBoYXZl
IGdvb2QvYmFkIGtlcm5lbCB2ZXJzaW9uPyBJIHdhcyBsb29raW5nIGF0IHJlY2VudAo+IHVwc3Ry
ZWFtIGNoYW5nZXMsIGJ1dCBkaWRuJ3Qgc3BvdCBhbnl0aGluZyB0aGF0IGNvdWxkIGV4cGxhaW4K
PiB0aGF0IEVJTlZBTC4KCgpJIGRpZG4ndCB0ZXN0IGFsbCB2ZXJzaW9ucyBvZiBrZXJuZWwuIEJ1
dCBhZnRlciB2NS4xLW1pcHMgY2FuIHJhaXNlIHRoZSAKcHJvYmxlbS4KCk1heWJlIHRoZSBidWcg
ZXhpc3RzIG9uIG1pcHMgc2luY2UgdGhlIHRlc3RjYXNlIGlzIGNyZWF0ZWQuCgpJIGd1ZXNzIHRo
YXQgZmV3IHBlb3BsZSB1c2UgbWlwcyBub3csIHNvIHRoZSBidWcgaXMgbm90IGZvdW5kIGluIHRp
bWUuCgoKLS1Ib25nemhpCgoKPj4KPj4gLS1Ib25nemhpCj4+Cj4+Cj4+Cj4+IE9uIDYvMjgvMTkg
NzowOSBQTSwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4+PiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0t
LS0tCj4+Pj4gKkx0cDoqCj4+Pj4KPj4+PiBsYXRlc3QgbWFzdGVyCj4+Pj4KPj4+Pgo+Pj4+ICpL
ZXJuZWw6Kgo+Pj4+Cj4+Pj4gQWZ0ZXIgdjUuMSBBUkNIPW1pcHM2NAo+Pj4+Cj4+Pj4KPj4+PiAq
RXJyb3IgaW5mbzoqCj4+Pj4KPj4+PiBkaW90ZXN0NCAxMCBUQlJPSyA6IGRpb3Rlc3Q0LmM6MzY4
OiBjYW4ndCBtbWFwIGZpbGU6IEludmFsaWQgYXJndW1lbnQKPj4+PiBkaW90ZXN0NCAxMSBUQlJP
SyA6IGRpb3Rlc3Q0LmM6MzY4OiBSZW1haW5pbmcgY2FzZXMgYnJva2VuCj4+Pj4KPj4+Pgo+Pj4+
IEkgdGhpbmsgdGhlIGZpcnN0IGFyZ3VtZW50IG9mIG1tYXAgaXMgaW52YWxpZC4KPj4+Pgo+Pj4+
ICAgIMKgwqAgPnNobV9iYXNlID0gKGNoYXIgKikoKChsb25nKXNicmsoMCkgKyAoc2htc3ogLSAx
KSkgJiB+KHNobXN6IC0gMSkpOwo+Pj4+Cj4+Pj4gICAgwqDCoCA+c2htX2Jhc2UgPSBtbWFwKHNo
bV9iYXNlLCAweDEwMDAwMCwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwKPj4+IEkgZG9uJ3Qgc2Vl
IGFueSBub3RlIHdoeSB0aGF0IG1tYXAgbmVlZHMgdG8gYmUgTUFQX0ZJWEVELiBJJ2QgZHJvcCBp
dCwKPj4+IGxldCBrZXJuZWwgcGljayBhbiBhZGRyZXNzOgo+Pj4KPj4+IGRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NC5jCj4+PiBiL3Rlc3RjYXNlcy9r
ZXJuZWwvaW8vZGlyZWN0X2lvL2Rpb3Rlc3Q0LmMKPj4+IGluZGV4IGU0NjE2ZTQwMGFiZC4uYmYy
MDBjZDQxYTI3IDEwMDY0NAo+Pj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9pby9kaXJlY3RfaW8v
ZGlvdGVzdDQuYwo+Pj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9pby9kaXJlY3RfaW8vZGlvdGVz
dDQuYwo+Pj4gQEAgLTM1MiwxOCArMzUyLDE0IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICph
cmd2W10pCj4+PiAgICAgICAgICAgdG90YWwrKzsKPj4+Cj4+PiAgICAgICAgICAgLyogVGVzdC0x
MDogcmVhZCwgd3JpdGUgdG8gYSBtbWFwZWQgZmlsZSAqLwo+Pj4gLSAgICAgICBzaG1fYmFzZSA9
IChjaGFyICopKCgobG9uZylzYnJrKDApICsgKHNobXN6IC0gMSkpICYgfihzaG1zeiAtIDEpKTsK
Pj4+IC0gICAgICAgaWYgKHNobV9iYXNlID09IE5VTEwpIHsKPj4+IC0gICAgICAgICAgICAgICB0
c3RfYnJrbShUQlJPSywgY2xlYW51cCwgInNicmsgZmFpbGVkOiAlcyIsCj4+PiBzdHJlcnJvcihl
cnJubykpOwo+Pj4gLSAgICAgICB9Cj4+PiAgICAgICAgICAgb2Zmc2V0ID0gNDA5NjsKPj4+ICAg
ICAgICAgICBjb3VudCA9IGJ1ZnNpemU7Cj4+PiAgICAgICAgICAgaWYgKChmZCA9IG9wZW4oZmls
ZW5hbWUsIE9fRElSRUNUIHwgT19SRFdSKSkgPCAwKSB7Cj4+PiAgICAgICAgICAgICAgICAgICB0
c3RfYnJrbShUQlJPSywgY2xlYW51cCwgImNhbid0IG9wZW4gJXM6ICVzIiwKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGZpbGVuYW1lLCBzdHJlcnJvcihlcnJubykpOwo+Pj4gICAgICAg
ICAgIH0KPj4+IC0gICAgICAgc2htX2Jhc2UgPSBtbWFwKHNobV9iYXNlLCAweDEwMDAwMCwgUFJP
VF9SRUFEIHwgUFJPVF9XUklURSwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgIE1BUF9TSEFS
RUQgfCBNQVBfRklYRUQsIGZkLCAwKTsKPj4+ICsgICAgICAgc2htX2Jhc2UgPSBtbWFwKDAsIDB4
MTAwMDAwLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgTUFQX1NIQVJFRCwgZmQsIDApOwo+Pj4gICAgICAgICAgIGlmIChzaG1fYmFzZSA9PSAoY2Fk
ZHJfdCkgLSAxKSB7Cj4+PiAgICAgICAgICAgICAgICAgICB0c3RfYnJrbShUQlJPSywgY2xlYW51
cCwgImNhbid0IG1tYXAgZmlsZTogJXMiLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RyZXJyb3IoZXJybm8pKTsKPj4+CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

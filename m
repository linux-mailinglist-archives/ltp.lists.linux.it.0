Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4AD339479
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 18:15:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B9413C685D
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 18:15:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2AA5E3C305F
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 18:15:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C731A601E26
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 18:15:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED915AF4D
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 17:15:23 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>
References: <20210309171104.30821-1-mdoucha@suse.cz> <YEtCWbqdGq5Yc99s@pevik>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <f775b926-6bd1-2f93-707a-fbbc7ebe6dc4@suse.cz>
Date: Fri, 12 Mar 2021 18:15:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEtCWbqdGq5Yc99s@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add FS quota availability check functions
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTIuIDAzLiAyMSAxMToyOCwgUGV0ciBWb3JlbCB3cm90ZToKPiBIaSBNYXJ0aW4sCj4gCj4+
ICtpbnQgdHN0X2NoZWNrX3F1b3RhX3N1cHBvcnQoY29uc3QgY2hhciAqZGV2aWNlLCBpbnQgZm9y
bWF0LAo+PiArCWNvbnN0IGNoYXIgKnF1b3RhZmlsZSkKPj4gK3sKPj4gKwlURVNUKHF1b3RhY3Rs
KFFDTUQoUV9RVU9UQU9OLCBVU1JRVU9UQSksIGRldmljZSwgZm9ybWF0LCBxdW90YWZpbGUpKTsK
PiBBY3R1YWxseSwgdGhlcmUgaXMgYSB3YXJuaW5nOgo+IHRzdF9zdXBwb3J0ZWRfZnNfdHlwZXMu
YzogSW4gZnVuY3Rpb24g4oCYdHN0X2NoZWNrX3F1b3RhX3N1cHBvcnTigJk6Cj4gdHN0X3N1cHBv
cnRlZF9mc190eXBlcy5jOjExNzo1OTogd2FybmluZzogcGFzc2luZyBhcmd1bWVudCA0IG9mIOKA
mHF1b3RhY3Rs4oCZIGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxpZmllciBmcm9tIHBvaW50ZXIg
dGFyZ2V0IHR5cGUgWy1XZGlzY2FyZGVkLXF1YWxpZmllcnNdCj4gICAxMTcgfCAgVEVTVChxdW90
YWN0bChRQ01EKFFfUVVPVEFPTiwgVVNSUVVPVEEpLCBkZXZpY2UsIGZvcm1hdCwgcXVvdGFmaWxl
KSk7Cj4gCj4gV291bGQgeW91IHByZWZlciB0byBjYXN0IHRvIGNoYXIgKiwgb3IganVzdCBjaGFu
Z2UgZnVuY3Rpb24gcGFyYW1ldGVyIHRvIGNoYXIgKj8KClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhp
cy4gUGFzc2luZyBzdHJpbmcgbGl0ZXJhbHMgdG8gdGhlIGZ1bmN0aW9uCmRpcmVjdGx5IGlzIHRl
Y2huaWNhbGx5IHdyb25nIHNvIEknbGwgZHJvcCB0aGUgY29uc3QgYW5kIGZpeCB0aGUgdGVzdHMK
dG8gYWxsb2NhdGUgYSBidWZmZXIgZm9yIHF1b3RhZmlsZSBwYXRocy4gSSdsbCByZXN1Ym1pdCBv
biBNb25kYXkuCgotLSAKTWFydGluIERvdWNoYSAgIG1kb3VjaGFAc3VzZS5jegpRQSBFbmdpbmVl
ciBmb3IgU29mdHdhcmUgTWFpbnRlbmFuY2UKU1VTRSBMSU5VWCwgcy5yLm8uCkNPUlNPIElJYQpL
cml6aWtvdmEgMTQ4LzM0CjE4NiAwMCBQcmFndWUgOApDemVjaCBSZXB1YmxpYwoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

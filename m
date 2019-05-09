Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 063FE18493
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 06:36:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D06483EABCE
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 06:36:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1FEC33EABBE
 for <ltp@lists.linux.it>; Thu,  9 May 2019 06:36:09 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 080736011B7
 for <ltp@lists.linux.it>; Thu,  9 May 2019 06:36:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,448,1549900800"; d="scan'208";a="62209811"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 May 2019 12:36:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
 by cn.fujitsu.com (Postfix) with ESMTP id 8A8E64CDB2FF;
 Thu,  9 May 2019 12:36:04 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 9 May 2019 12:36:16 +0800
Message-ID: <5CD3AE33.1080202@cn.fujitsu.com>
Date: Thu, 9 May 2019 12:36:03 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: He Zhe <zhe.he@windriver.com>
References: <1555922118-412699-1-git-send-email-zhe.he@windriver.com>
 <5CBD8D83.4080901@cn.fujitsu.com>
 <04eacb36-fde2-1468-68f7-23b6d146a5f3@windriver.com>
In-Reply-To: <04eacb36-fde2-1468-68f7-23b6d146a5f3@windriver.com>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: 8A8E64CDB2FF.ADF63
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] file01.sh: Fix in was not recognized
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWmhlLAoKSSBhbSBzb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuICBUaGFua3MgZm9yIHlvdXIg
cGFjdGggYW5kIHB1c2hlZC4KCkJUVzoKSSB0cnkgdG8gdGhpbmsgYWJvdXQgc2ltcGxpZnlpbmcg
YWxsIGtleXdvcmRzIGJ5IGV4dGVuZGVkIHJlZ3VsYXIgCmV4cHJlc3Npb24uCihlLmcuIHVzZSAo
cGllICk/IHRvIG1hdGNoIHlvdXIgZW5jb3VudGVyZWQga2V5d29yZHMpLgoKQmVzdCBSZWdhcmRz
LApYaWFvIFlhbmcKT24gMjAxOS8wNC8yMiAxNzo1MywgSGUgWmhlIHdyb3RlOgo+Cj4gT24gNC8y
Mi8xOSA1OjQ2IFBNLCBYaWFvIFlhbmcgd3JvdGU6Cj4+IE9uIDIwMTkvMDQvMjIgMTY6MzUsIHpo
ZS5oZUB3aW5kcml2ZXIuY29tIHdyb3RlOgo+Pj4gRnJvbTogSGUgWmhlPHpoZS5oZUB3aW5kcml2
ZXIuY29tPgo+Pj4KPj4+IFNvbWUgZmlsZSBoYXMgInBpZSIgYXBwZW5kaW5nIGFmdGVyIExTQiBv
ciBNU0IsIHdoaWNoIGNhdXNlcyBtaXNtYXRjaCBhbmQgdGhlCj4+PiBmb2xsb3dpbmcgZXJyb3Iu
Cj4+Pgo+Pj4gImZpbGUwMSAxMCBURkFJTDogaW46IHdhcyBub3QgcmVjb2duaXplZCIKPj4+IC4u
LiJFTEYgNjQtYml0IExTQiBwaWUgZXhlY3V0YWJsZSIuLi4KPj4+Cj4+PiBUaGlzIHBhdGNoZXMg
dHVuZXMgdGhlIHJlZ3VsYXRpb24gZXhwcmVzc2lvbiB0byBpbmNsdWRlIHRob3NlIGNhc2VzLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEhlIFpoZTx6aGUuaGVAd2luZHJpdmVyLmNvbT4KPj4+IC0t
LQo+Pj4gdjEgdG8gdjI6IHNwbGl0IGludG8gdHdvIGdyb3VwcyB0byBqdXN0IG1hdGNoIHRoZSBl
bmNvdW50ZXJlZCBjYXNlCj4+Pgo+Pj4gICAgdGVzdGNhc2VzL2NvbW1hbmRzL2ZpbGUvZmlsZTAx
LnNoIHwgNCArKystCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9jb21tYW5kcy9maWxlL2Zp
bGUwMS5zaCBiL3Rlc3RjYXNlcy9jb21tYW5kcy9maWxlL2ZpbGUwMS5zaAo+Pj4gaW5kZXggMGE4
MTE5ZS4uNTVjMDQzMyAxMDA3NTUKPj4+IC0tLSBhL3Rlc3RjYXNlcy9jb21tYW5kcy9maWxlL2Zp
bGUwMS5zaAo+Pj4gKysrIGIvdGVzdGNhc2VzL2NvbW1hbmRzL2ZpbGUvZmlsZTAxLnNoCj4+PiBA
QCAtOTEsNyArOTEsOSBAQCBkb190ZXN0KCkKPj4+ICAgICAgICAgOSkgZmlsZV90ZXN0IGluLm00
ICJNNCBtYWNybyBwcm9jZXNzb3Igc2NyaXB0LCBBU0NJSSB0ZXh0IiBcCj4+PiAgICAgICAgICAg
ICAgICAgICAgIkFTQ0lJIE00IG1hY3JvIGxhbmd1YWdlIHByZS1wcm9jZXNzb3IgdGV4dCI7Owo+
Pj4gICAgICAgIDEwKSBmaWxlX3Rlc3QgaW4gIkVMRiAuKi1iaXQgJFRFU1RfQVJDSCBleGVjdXRh
YmxlLCAuKiIgXAo+Pj4gLSAgICAgICAgICAgICAiRUxGIC4qLWJpdCAkVEVTVF9BUkNIIHNoYXJl
ZCBvYmplY3QsIC4qIjs7Cj4+PiArICAgICAgICAgICAgICJFTEYgLiotYml0ICRURVNUX0FSQ0gg
c2hhcmVkIG9iamVjdCwgLioiIFwKPj4+ICsgICAgICAgICAgICAgIkVMRiAuKi1iaXQgJFRFU1Rf
QVJDSCBwaWUgZXhlY3V0YWJsZSwgLioiIFwKPj4+ICsgICAgICAgICAgICAgIkVMRiAuKi1iaXQg
JFRFU1RfQVJDSCBwaWUgc2hhcmVkIG9iamVjdCwgLioiOzsKPj4gSGkgSGUsCj4+Cj4+IFBlcmhh
cCwgaXQncyBzaW1wbGVyIHRvIHVzZSB0aGUg4oCYLirigJlyZWdleHAgZGlyZWN0bHkgYXMgeW91
ciBmaXJzdCBwYXRjaCBkb2VzOgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pgo+PiAtICAgIDEwKSBmaWxl
X3Rlc3QgaW4gIkVMRiAuKi1iaXQgJFRFU1RfQVJDSCBleGVjdXRhYmxlLCAuKiIgXAo+PiAtICAg
ICAgICAgICAgICJFTEYgLiotYml0ICRURVNUX0FSQ0ggc2hhcmVkIG9iamVjdCwgLioiOzsKPj4g
KyAgICAxMCkgZmlsZV90ZXN0IGluICJFTEYgLiotYml0ICRURVNUX0FSQ0ggLipleGVjdXRhYmxl
LCAuKiIgXAo+PiArICAgICAgICAgICAgICJFTEYgLiotYml0ICRURVNUX0FSQ0ggLipzaGFyZWQg
b2JqZWN0LCAuKiI7Owo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IE5vdCBleGFjdGx5LCBub3cgaXQg
Y2FuIG1hdGNoIDQgZGlmZmVyZW50IGNhc2VzLgo+Cj4gWmhlCj4KPj4gQmVzdCBSZWdhcmRzLAo+
PiBYaWFvIFlhbmcKPj4+ICAgICAgICAxMSkgZmlsZV90ZXN0IGluLmFyICJjdXJyZW50IGFyIGFy
Y2hpdmUiOzsKPj4+ICAgICAgICAxMikgZmlsZV90ZXN0IGluLnRhciAidGFyIGFyY2hpdmUiOzsK
Pj4+ICAgICAgICAxMykgZmlsZV90ZXN0IGluLnRhci5neiAiZ3ppcCBjb21wcmVzc2VkIGRhdGEs
IC4qIjs7Cj4+Cj4+Cj4+Cj4KPgo+IC4KPgoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

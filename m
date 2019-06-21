Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEDD4E5E0
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 12:27:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8CBD3EB027
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 12:27:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8334E2989CC
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 12:27:01 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2B9A260107E
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 12:26:56 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,398,1557158400"; d="scan'208";a="68426990"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Jun 2019 18:26:45 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id B10154CD9588;
 Fri, 21 Jun 2019 18:26:42 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 21 Jun 2019 18:26:43 +0800
Message-ID: <5D0CB0E1.8020205@cn.fujitsu.com>
Date: Fri, 21 Jun 2019 18:26:41 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Jan Stancek <jstancek@redhat.com>
References: <1561110806-2734-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1766730430.29482900.1561112032870.JavaMail.zimbra@redhat.com>
In-Reply-To: <1766730430.29482900.1561112032870.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: B10154CD9588.A9D35
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] daemonlib.sh: call tty before executing service
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

Cj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+PiBPbiBteSBtYWNoaW5lLCBwb2xraXQt
MC4xMTItMjIuZWw3Lng4Nl82NCBoYXMgY29udGFpbmVkIHRoZSBbMV0gcGF0Y2guCj4+Cj4+IFRo
aXMgcGF0Y2ggbGVhZHMgc2VydmljZSBhY2l0b25zKHN1Y2ggYXMgcmVzdGFydCkgZG9uJ3Qgc3Rv
cCBpZiBpdCBkb2Vzbid0Cj4+IGZpbmQgY29udHJvbGxpbmcgdGVybWluYWwuIEV2ZW4gdGhlIHNl
cnZpY2UgaGFzIGJlZW4gZXhlY3V0ZWQgc3VjY2Vzc2Z1bGx5Lgo+PiBZb3UgY2FuIHJlcHJvZHVj
ZSBpdCB3aXRoIHRoZSBmb2xsb3dpbmcgY29kZToKPj4KPj4gdGVzdC5zaAo+PiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IGVjaG8gInJlc3RhcnQgZGFl
bW9uIgo+PiBzeXN0ZW1jdGwgcmVzdGFydCByc3lzbG9nLnNlcnZpY2U+L2Rldi9udWxsIDI+JjEK
Pj4gZWNobyAicmVzdGFydCBzdWNjZXNzIgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4+IC4vdGVzdC5zaCYgICAoaXQgZG9lc24ndCBzdG9wKQo+PiBy
ZXN0YXJ0IGRhZW1vbgo+Pgo+PiBwcyAtYXV4Zgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAuLi4uIHB0cy8xICAgIFQgICAgICBcXyAvYmlu
L2Jhc2ggLi90ZXN0LnNoCj4+IC4uLi4gcHRzLzEgICAgVCAgICAgICAgXF8gc3lzdGVtY3RsIHJl
c3RhcnQgcnN5c2xvZy5zZXJ2aWNlCj4+IC4uLi4gcHRzLzEgICAgVGwgICAgICAgICBcXyAvdXNy
L2Jpbi9wa3R0eWFnZW50IC0tbm90aWZ5LWZkIDYKPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pgo+PiAvdmFyL2xvZy9zZWN1cmUKPj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IHBvbGtpdGRbMTMx
MF06IFJlZ2lzdGVyZWQgQXV0aGVudGljYXRpb24gQWdlbnQgZm9yIHVuaXgtcHJvY2VzczoxODQ3
MjoyNTIzMjUKPj4gKHN5c3RlbSBidXMgbmFtZSA6MS4xMDUgWy91c3IvYmluL3BrdHR5YWdlbnQg
LS1ub3RpZnktZmQgNiAtLWZhbGxiYWNrXSwKPj4gb2JqZWN0Cj4+IHBhdGggL29yZy9mcmVlZGVz
a3RvcC9Qb2xpY3lLaXQxL0F1dGhlbnRpY2F0aW9uQWdlbnQsIGxvY2FsZSBlbl9VUy5VVEYtOCkK
Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Cj4+
IFRoaXMgY2hhbmdlIGxlYWRzIHRvIHN5c2xvZ1sxLTEwXSB0ZXN0Y2FzZSBoYW5nLiBJIGZpeCBp
dCBieSBhZGRpbmcgdHR5Cj4+IGJlZm9yY2UKPj4gc2VydmljZSwgc28gdGhlc2UgY2FzZXMgZG9u
J3QgaGFuZy4KPiBCdWcgMTcxMTUzNiAtIHBvbGtpdC0wLjExMi0yMi5lbDcgYnJlYWtzIHJlc3Rh
cnRpbmcgc2VydmljZXMgZnJvbSBiYWNrZ3JvdW5kIHByb2Nlc3MKPiBodHRwczovL2J1Z3ppbGxh
LnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE3MTE1MzYKPgo+IE5vdCBzdXJlIHRob3VnaCB3
ZSBzaG91bGQgYmUgYWRkaW5nIHdvcmthcm91bmRzIGZvciB3aGF0IHNlZW1zIGxpa2UgYSBidWcu
CkhpIEphbgoKICAgICBJIGFsc28gdGhpbmsgaXQgbWF5IGJlIGEgcG9sa2l0IHJwbSBidWcgYmVj
YXVzZSB0aGlzIGFjdGlvbiBpcyB0b28gYWJub3JtYWwuCk9yLCB3ZSBjYW4gYXNrIHBvbGtpdCBt
YW50YWluZXIgYWJvdXQgaXQgIG9uIGdpdGxhYi4KClJlZ2FyZHMKWWFuZyBYdQoKPiBSZWdhcmRz
LAo+IEphbgo+Cj4+IChwa3R0eWFnZW50OiBQb2xraXRBZ2VudFRleHRMaXN0ZW5lciBsZWF2ZXMg
ZWNobyB0dHkgZGlzYWJsZWQgaWYKPj4gU0lHSU5UL1NJR1RFUk0pCj4+IFsxXWh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9wb2xraXQvcG9sa2l0L2NvbW1pdC9iZmI3MjJiYmU1YTUwMzA5
NWNjN2U4NjBmMjgyYjE0MmY1YWE3NWYxCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWHU8eHV5
YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4KPj4gLS0tCj4+ICAgdGVzdGNhc2VzL2xpYi9kYWVt
b25saWIuc2ggfCAyNCArKysrKysrKysrKystLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMvbGliL2RhZW1vbmxpYi5zaCBiL3Rlc3RjYXNlcy9saWIvZGFlbW9ubGliLnNoCj4+
IGluZGV4IDBkZTNmODZhZi4uNTgwN2NiZWEwIDEwMDY0NAo+PiAtLS0gYS90ZXN0Y2FzZXMvbGli
L2RhZW1vbmxpYi5zaAo+PiArKysgYi90ZXN0Y2FzZXMvbGliL2RhZW1vbmxpYi5zaAo+PiBAQCAt
NDcsNDMgKzQ3LDQzIEBAIGZpCj4+ICAgc3RhcnRfZGFlbW9uKCkKPj4gICB7Cj4+ICAgCWlmIFsg
JEhBVkVfU1lTVEVNQ1RMIC1lcSAxIF07IHRoZW4KPj4gLQkJc3lzdGVtY3RsIHN0YXJ0ICQxLnNl
cnZpY2U+ICAvZGV2L251bGwgMj4mMQo+PiArCQl0dHkgfCBzeXN0ZW1jdGwgc3RhcnQgJDEuc2Vy
dmljZT4gIC9kZXYvbnVsbCAyPiYxCj4+ICAgCWVsaWYgY29tbWFuZCAtdiBzZXJ2aWNlPi9kZXYv
bnVsbCAyPiYxOyB0aGVuCj4+IC0JCXNlcnZpY2UgJDEgc3RhcnQ+ICAvZGV2L251bGwgMj4mMQo+
PiArCQl0dHkgfCBzZXJ2aWNlICQxIHN0YXJ0PiAgL2Rldi9udWxsIDI+JjEKPj4gICAJZWxzZQo+
PiAtCQkvZXRjL2luaXQuZC8kMSBzdGFydD4gIC9kZXYvbnVsbCAyPiYxCj4+ICsJCXR0eSB8L2V0
Yy9pbml0LmQvJDEgc3RhcnQ+ICAvZGV2L251bGwgMj4mMQo+PiAgIAlmaQo+PiAgIH0KPj4KPj4g
ICBzdG9wX2RhZW1vbigpCj4+ICAgewo+PiAgIAlpZiBbICRIQVZFX1NZU1RFTUNUTCAtZXEgMSBd
OyB0aGVuCj4+IC0JCXN5c3RlbWN0bCBzdG9wICQxLnNlcnZpY2U+ICAvZGV2L251bGwgMj4mMQo+
PiArCQl0dHkgfCBzeXN0ZW1jdGwgc3RvcCAkMS5zZXJ2aWNlPiAgL2Rldi9udWxsIDI+JjEKPj4g
ICAJZWxpZiBjb21tYW5kIC12IHNlcnZpY2U+L2Rldi9udWxsIDI+JjE7IHRoZW4KPj4gLQkJc2Vy
dmljZSAkMSBzdG9wPiAgL2Rldi9udWxsIDI+JjEKPj4gKwkJdHR5IHwgc2VydmljZSAkMSBzdG9w
PiAgL2Rldi9udWxsIDI+JjEKPj4gICAJZWxzZQo+PiAtCQkvZXRjL2luaXQuZC8kMSBzdG9wPiAg
L2Rldi9udWxsIDI+JjEKPj4gKwkJdHR5IHwgL2V0Yy9pbml0LmQvJDEgc3RvcD4gIC9kZXYvbnVs
bCAyPiYxCj4+ICAgCWZpCj4+ICAgfQo+Pgo+PiAgIHN0YXR1c19kYWVtb24oKQo+PiAgIHsKPj4g
ICAJaWYgWyAkSEFWRV9TWVNURU1DVEwgLWVxIDEgXTsgdGhlbgo+PiAtCQlzeXN0ZW1jdGwgaXMt
YWN0aXZlICQxLnNlcnZpY2U+ICAvZGV2L251bGwgMj4mMQo+PiArCQl0dHkgfCBzeXN0ZW1jdGwg
aXMtYWN0aXZlICQxLnNlcnZpY2U+ICAvZGV2L251bGwgMj4mMQo+PiAgIAllbGlmIGNvbW1hbmQg
LXYgc2VydmljZT4vZGV2L251bGwgMj4mMTsgdGhlbgo+PiAtCQlzZXJ2aWNlICQxIHN0YXR1cz4g
IC9kZXYvbnVsbCAyPiYxCj4+ICsJCXR0eSB8IHNlcnZpY2UgJDEgc3RhdHVzPiAgL2Rldi9udWxs
IDI+JjEKPj4gICAJZWxzZQo+PiAtCQkvZXRjL2luaXQuZC8kMSBzdGF0dXM+ICAvZGV2L251bGwg
Mj4mMQo+PiArCQl0dHkgfCAvZXRjL2luaXQuZC8kMSBzdGF0dXM+ICAvZGV2L251bGwgMj4mMQo+
PiAgIAlmaQo+PiAgIH0KPj4KPj4gICByZXN0YXJ0X2RhZW1vbigpCj4+ICAgewo+PiAgIAlpZiBb
ICRIQVZFX1NZU1RFTUNUTCAtZXEgMSBdOyB0aGVuCj4+IC0JCXN5c3RlbWN0bCByZXN0YXJ0ICQx
LnNlcnZpY2U+ICAvZGV2L251bGwgMj4mMQo+PiArCQl0dHkgfCBzeXN0ZW1jdGwgcmVzdGFydCAk
MS5zZXJ2aWNlPiAgL2Rldi9udWxsIDI+JjEKPj4gICAJZWxpZiBjb21tYW5kIC12IHNlcnZpY2U+
L2Rldi9udWxsIDI+JjE7IHRoZW4KPj4gLQkJc2VydmljZSAkMSByZXN0YXJ0PiAgL2Rldi9udWxs
IDI+JjEKPj4gKwkJdHR5IHwgc2VydmljZSAkMSByZXN0YXJ0PiAgL2Rldi9udWxsIDI+JjEKPj4g
ICAJZWxzZQo+PiAtCQkvZXRjL2luaXQuZC8kMSByZXN0YXJ0PiAgL2Rldi9udWxsIDI+JjEKPj4g
KwkJdHR5IHwgL2V0Yy9pbml0LmQvJDEgcmVzdGFydD4gIC9kZXYvbnVsbCAyPiYxCj4+ICAgCWZp
Cj4+ICAgfQo+PiAtLQo+PiAyLjE4LjEKPj4KPj4KPj4KPj4KPj4gLS0KPj4gTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCj4+Cj4KPiAuCj4KCgoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

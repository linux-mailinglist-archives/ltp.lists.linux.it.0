Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D15E73B17B
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 11:07:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D53B3EB017
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 11:07:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DC7D73EB017
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 11:06:58 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 2515A1A00F8B
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 11:06:55 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,572,1557158400"; d="scan'208";a="66733072"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2019 17:06:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 903054CDD0B3;
 Mon, 10 Jun 2019 17:06:49 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 10 Jun 2019 17:06:51 +0800
Message-ID: <5CFE1DA6.7010600@cn.fujitsu.com>
Date: Mon, 10 Jun 2019 17:06:46 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1559817080-2991-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1559817930-2299-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190606114134.GB13068@rei.lan>
In-Reply-To: <20190606114134.GB13068@rei.lan>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 903054CDD0B3.ABF20
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] sysctl/sysctl02: Add new regression test for
 overflow file-max
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

SGkgY3J5aWwKCj4gSGkhCj4gK3sKPiArCWNhc2UgJDEgaW4KPiArCTEpc3lzY3RsX3Rlc3Rfb3Zl
cmZsb3cgJHtjaGVjazF9OzsKPiArCTIpc3lzY3RsX3Rlc3Rfb3ZlcmZsb3cgJHtjaGVjazJ9OzsK
PiArCTMpc3lzY3RsX3Rlc3Rfb3ZlcmZsb3cgJHtjaGVjazN9OzsKPiArCTQpc3lzY3RsX3Rlc3Rf
emVybyAke2NoZWNrNH07Owo+IFRoZXJlIGlzIG5vIHBvaW50IGluIGhhdmluZyB0aGUgbnVtYmVy
cyBpbiBjaGVjayB2YXJpYWJsZXMgaWYgd2UgZG8gY2FzZQo+IGhlcmUsIHdlIGNhbiBqdXN0IHBh
c3MgaXQgaGVyZS4KT0suIEkgd2lsbCBwYXNzIHRoZSBudW1iZXIgZGlyZWN0bHkuCgo+PiArCWVz
YWMKPj4gK30KPj4gKwo+PiArc3lzY3RsX3Rlc3Rfb3ZlcmZsb3coKQo+PiArewo+PiArCWxvY2Fs
IG9sZF92YWx1ZT0kKGNhdCAiJGRpciIiJG5hbWUiKQo+PiArCj4+ICsJc3lzY3RsIC13ICJmcy5m
aWxlLW1heCI9JDE+L2Rldi9udWxsIDI+JjEKPj4gKwo+PiArCWxvY2FsIHRlc3RfdmFsdWU9JChj
YXQgIiRkaXIiIiRuYW1lIikKPj4gKwo+PiArCWVjaG8gJHt0ZXN0X3ZhbHVlfSB8Z3JlcCAtcSAk
e29sZF92YWx1ZX0KPj4gKwlpZiBbICQ/IC1lcSAwIF07IHRoZW4KPj4gKwkJdHN0X3JlcyBUUEFT
UyAiZmlsZS1tYXggb3ZlcmZsb3csIHJlamVjdCBpdCBhbmQga2VlcCBvbGQgdmFsdWUuIgo+PiAr
CWVsc2UKPj4gKwkJdHN0X3JlcyBURkFJTCAiZmlsZS1tYXggb3ZlcmZsb3cgYW5kIHNldCBpdCB0
byAke3Rlc3RfdmFsdWV9LiIKPj4gKwlmaQo+PiArCWNsZWFudXAKPj4gK30KPj4gKwo+PiArc3lz
Y3RsX3Rlc3RfemVybygpCj4+ICt7Cj4+ICsJc3lzY3RsIC13ICJmcy5maWxlLW1heCI9JDE+L2Rl
di9udWxsIDI+JjEKPj4gKwl0c3RfcmVzIFRJTkZPICJpZiBpdCBkb2Vzbid0IHJlcG9ydCBUUEFT
UyBhZnRlciA2MHMgc2xlZXAsIHN5c3RlbSBjcmFzaGVzIgo+PiArCXNsZWVwIDYwCj4gV2hhdCBo
YXBwZW5zIG9uIHRoZSBidWdneSBrZXJuZWwgaGVyZT8KPgo+IERvZXMgaXQgY3Jhc2ggcmVsaWFi
bHk/Cj4KPiBJdCBsb29rcyB0byBtZSB0aGF0IHJlcHJvZHVjaW5nIHRoaXMgYnVnIHdpdGhvdXQg
S0FTQU4gZW5hYmxlZCBrZXJuZWwKPiB3b3VsZCBiZSByZWFsbHkgaGFyZCBvciBldmVuIGltcG9z
c2libGUsIHRoZXJlZm9yZSB0aGUgc2xlZXAgaGVyZSBkb2VzCj4gbm90IG1hdHRlciBhdCBhbGwu
Clllcy4gIEl0IGNyYXNoZXMgYWx3YXlzIG9uIG15IG1hY2hpbmUgYnV0IG5vdCBoYXZpbmcgY3Jh
c2ggbG9nICh1bmRlciAvdmFyL2NyYXNoKSB3aXRob3V0IENPTkZJRl9LQVNBTiwgYW5kIGl0IGhh
bmdzIHdoZW4gc2xlZXAgMTIwcyB3aXRoIENPTkZJR19LQVNBTj15LgpJIHRoaW5rIGl0IGNyYXNo
ZXMgb3IgaGFuZ3MgYmVjYXVzZSB0aGUgZmlsZS1tYXggaXMgZXF1YWwgdG8gMCBhbmQgaXQgY2F1
c2VzIHNvbWUgc3lzdGVtIHNlcnZpY2VzIG9yIGRhZW1vbnMgY2FuIG5vdCBydW4gbm9ybWFsbHku
IFRlc3QgaXQgbWFrZXMgbm8gc2Vuc2UuCgpUaGlzIGlzIG5vdCB3aGF0IEkgd2FudCB0byB0ZXN0
LiAgSSBvbmx5IHdhbnQgdG8gdGVzdCB3aGV0aGVyIHRyaWdnZXIgYSBLQVNBTiBlcnJvciBieSBz
ZXR0aW5nIDAuCkkgd2lsbCBzZW5kIGEgdjMgcGF0Y2guCgo+PiArCXRzdF9yZXMgVFBBU1MgImZp
bGUtbWF4IGlzIHNldCAwIGFuZCBkb2Vzbid0IGNyYXNoIgo+PiArfQo+PiArCj4+ICtjbGVhbnVw
KCkKPj4gK3sKPj4gKwlzeXNjdGwgLXcgImZzLiIiJG5hbWUiPSR7b3JpZ192YWx1ZX0+L2Rldi9u
dWxsIDI+JjEKPj4gK30KPj4gKwo+PiArdHN0X3J1bgo+PiAtLSAKPj4gMi4xOC4xCj4+Cj4+Cj4+
Cj4+Cj4+IC0tIAo+PiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAKCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK

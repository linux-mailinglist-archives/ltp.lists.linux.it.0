Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 247EE1D0782
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 08:31:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4C5E3C23BF
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 08:31:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7AE7B3C13D8
 for <ltp@lists.linux.it>; Wed, 13 May 2020 08:31:55 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 40B9660111C
 for <ltp@lists.linux.it>; Wed, 13 May 2020 08:31:51 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,386,1583164800"; d="scan'208";a="91981591"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2020 14:31:47 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 4FAA64BCC89D;
 Wed, 13 May 2020 14:31:45 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 May 2020 14:31:43 +0800
Message-ID: <5EBB944F.5010303@cn.fujitsu.com>
Date: Wed, 13 May 2020 14:31:43 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <20200513012626.1571-2-yangx.jy@cn.fujitsu.com>
 <20200513055533.ipmghf2oacc22mzy@vireshk-i7>
 <5EBB8DAA.5080509@cn.fujitsu.com>
 <20200513061343.mjhmciatmx4sw2ub@vireshk-i7>
In-Reply-To: <20200513061343.mjhmciatmx4sw2ub@vireshk-i7>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4FAA64BCC89D.AC967
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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

5LqOIDIwMjAvNS8xMyAxNDoxMywgVmlyZXNoIEt1bWFyIOWGmemBkzoKPiBPbiAxMy0wNS0yMCwg
MTQ6MDMsIFhpYW8gWWFuZyB3cm90ZToKPj4gQ291bGQgeW91IHRlbGwgd2hpY2ggaXNzdWUgaGFw
cGVuPyBUaGFua3MgYSBsb3QuCj4+IFRoZSBvdGhlciB0d28gZG9uJ3QgbmVlZCB0aGUgZXh0cmEg
Y2hlY2sgYmVjYXVzZSB0aGUgaW1wbGVtZW50YXRpb24gb2YKPj4gcGlkZmRfb3BlbigpIGNhbiBk
byBpdCB3ZWxsLiAgRm9yIDNyZCB0ZXN0LCBJIHdhbnQgdG8gY2hlY2sgdGhlIHN1cHBvcnQgb2YK
Pj4gcGlkZnNfb3BlbigpIGJlZm9yZSBkb2luZyBmb3JrKCkuCj4KPiBXaGF0IEkgbWVhbnQgd2Fz
IHRoYXQgdGhlIHNvbHV0aW9uIG5lZWRzIHRvIGJlIGNvbnNpc3RlbnQgYWNyb3NzCkhpIFZpcmVz
aCwKCkN1cnJlbnQgY2hhbmdlIGNhbiBkbyBjb3JyZWN0IGNoZWNrIGZvciBwaWRmZF9vcGVuWzEt
M10gc28gZG9uJ3QgbmVlZCB0byAKYWRkIHJlZHVuZGFudCBjaGVjay4KCj4gdGVzdHMuIEZvciBl
eGFtcGxlLCB3aXRoIHRoZSBjdXJyZW50IGNoYW5nZSB0aGUgcnVuKCkgZnVuY3Rpb24gd2lsbAo+
IHJ1biBmb3IgYWxsIHRlc3RzIGluIHBpZGZkX29wZW4wMi5jIGFuZCBwcmludCB0aGUgbWVzc2Fn
ZSB0aGF0IHN5c2NhbGwKPiBpc24ndCBzdXBwb3J0ZWQsIHdoaWxlIGl0IHdvdWxkIGJlIGJldHRl
ciB0byBydW4gaXQgb25seSBvbmNlIGluIHNldHVwCj4gYW5kIGdldCBkb25lIHdpdGggaXQuIGku
ZS4gMSBtZXNzYWdlIGluc3RlYWQgb2YgMyBzaW1pbGFyIG9uZXMuCj4KCkFyZSB5b3Ugc3VyZT8K
ClRyaWdnZXJpbmcgZmlyc3QgdHN0X2JyayhUQ09ORiwgLi4uKSB3aWxsIGJyZWFrIHRoZSB3aG9s
ZSB0ZXN0IGluc3RlYWQgCm9mIGEgc3VidGVzdC4KClRoYW5rcywKWGlhbyBZYW5nCgoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

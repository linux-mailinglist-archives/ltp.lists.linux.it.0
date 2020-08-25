Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7F125131D
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 09:25:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF29E3C2ED5
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 09:25:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 86B233C12A1
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:25:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 96F78600A44
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:25:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,351,1592841600"; d="scan'208";a="98511687"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Aug 2020 15:25:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0004E48990D8;
 Tue, 25 Aug 2020 15:25:21 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 25 Aug 2020 15:25:20 +0800
To: Li Wang <liwang@redhat.com>
References: <1597042181-12722-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <b0e940e7-945b-cdd9-695d-025bdc4a1ba1@cn.fujitsu.com>
 <CAEemH2dds8rJetEKXfwm5ck_knxOG=QFssbWtiRbxQk4oiZDVQ@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <eaf20eff-0b1f-fc59-f4b6-fab6340c462b@cn.fujitsu.com>
Date: Tue, 25 Aug 2020 15:25:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dds8rJetEKXfwm5ck_knxOG=QFssbWtiRbxQk4oiZDVQ@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0004E48990D8.AA741
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-2.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_inherit_test: Add cgroup.clone_children
 swith for cpuset.cpus and mems
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGkKCgo+IEhpIFh1LAo+IAo+IEkgaGVscGVkIGNvcnJlY3QgdGhlIHRlc3QgY291bnRpbmcg
YW5kIHB1c2hlZCBhZnRlciBzZWxmLXRlc3RpbmcuCk9oLCB5ZXMsIEkgZm9yZ290IHRoaXMgdGVz
dCBjb3VudGluZy4KVGhhbmtzLgoKQmVzdCBSZWdhcmRzCllhbmcgWHUKPiAKPiAtLS0tLS0tLS0t
LS0KPiAKPiAtIyBDYXNlIDEtMwo+ICsjIENhc2UgMS02Cj4gIMKgdGVzdF9jcHVzCj4gCj4gLSMg
Q2FzZSA0LTYKPiArIyBDYXNlIDctMTIKPiAgwqB0ZXN0X21lbXMKPiAKPiAtIyBDYXNlIDctMTQK
PiArIyBDYXNlIDEzLTIwCj4gIMKgdGVzdF90aHJlZV9yZXN1bHRfc2ltaWxhcl9mbGFncwo+IAo+
IC0jIENhc2UgMTUtMTgKPiArIyBDYXNlIDIxLTI0Cj4gIMKgdGVzdF9zcHJlYWRfZmxhZ3MKPiAK
PiAtIyBDYXNlIDE5LTIwCj4gKyMgQ2FzZSAyNS0yNgo+ICDCoHRlc3Rfc2NoZWRfbG9hZF9iYWxh
bmNlX2ZsYWcKPiAKPiAtIyBDYXNlIDIxLTI3Cj4gKyMgQ2FzZSAyNy0zMwo+ICDCoHRlc3RfZG9t
YWluCj4gCj4gLS0gCj4gUmVnYXJkcywKPiBMaSBXYW5nCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

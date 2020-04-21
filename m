Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A60391B1EB7
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:20:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C00313C29CE
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:20:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B42213C2994
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:20:00 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 84529600C3A
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:19:48 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; d="scan'208";a="89334383"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 14:19:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D3B5446B5FB0;
 Tue, 21 Apr 2020 14:09:01 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 14:19:35 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1586429086-22975-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200417151050.GA2491@yuki.lan>
 <8dd0a496-c46f-55d2-2393-5566eff618ff@cn.fujitsu.com>
 <48142e6b-8169-2934-e8b2-f71927cd62b0@cn.fujitsu.com>
 <20200420130140.GB11604@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <d3063175-5014-51ea-9d1c-4a9f3e2243b1@cn.fujitsu.com>
Date: Tue, 21 Apr 2020 14:19:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200420130140.GB11604@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D3B5446B5FB0.AE743
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 02/10] syscalls/ioctl:add common c file for
 loop ioctl
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril


> Hi!
>> +void tst_assert_file_str(const char *file, const int lineno, const char
>> *path, const char *buf, const char *val)
>> +{
>> +       char sys_val[1024];
>> +
>> +       SAFE_FILE_LINES_SCANF(path, buf, sys_val);
> 
> We should call the file_lines_scanf() here and pass the filename and
> lineno that this functions takes as parameter instead.
I don't understand the meaning of adding filename and line parameter(If 
fail, it will report tst_assert.c: 29). Do you want to report the 
correct parsed filename when failed?

If so, I think lineno is meaningless and it also overides the place of 
the code meet problem . I prefer to add some path info in safe_file_ops.c.

> 
> Also I'm not sure that it's a good idea to pass the fmt to this
> function. I guess that it would be better to pass a prefix string such
> as "foo=" and to append the "%s" in this function. That way we could
> also encode the buffer length to the fmt string as well, in that case we
> would append "%1024s".
> 
Yes, it is a better way.

ps: I will send a patch about this api.

Best Regards
Yang Xu
>> +       if (!strcmp(val, sys_val)) {
>> +               tst_res_(file, lineno, TPASS, "%s %s field = %s", path,
>> buf, sys_val);
>> +               return;
>> +       }
>> +
>> +       tst_res_(file, lineno, TFAIL, "%s %s field != %s got %s", path,
>> buf, val, sys_val);
>> +}
> 
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

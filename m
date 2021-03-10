Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C063033431C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 17:34:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B5473C6A38
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 17:34:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 657913C0CC6
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 17:34:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E30DF1000F68
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 17:34:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18489AC1F
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 16:34:04 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210310122625.25425-1-chrubis@suse.cz>
 <20210310122625.25425-2-chrubis@suse.cz>
 <30fec758-5e18-fceb-ec23-646253ba0e46@suse.cz> <YEjyLBZQ+D1CHqnq@rei.lan>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <b3391506-259b-1376-2c51-4d2a1557a44a@suse.cz>
Date: Wed, 10 Mar 2021 17:34:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEjyLBZQ+D1CHqnq@rei.lan>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: Add proper filesystem skiplist
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 10. 03. 21 17:22, Cyril Hrubis wrote:
> Hi!
>>> +static int has_kernel_support(const char *fs_type, const char *const *skiplist)
>>>  {
>>>  	static int fuse_supported = -1;
>>>  	const char *tmpdir = getenv("TMPDIR");
>>>  	char buf[128];
>>>  	int ret;
>>>  
>>> +	if (tst_fs_in_skiplist(fs_type, skiplist))
>>> +		return 0;
>>> +
>>>  	if (!tmpdir)
>>>  		tmpdir = "/tmp";
>>>  
>>> @@ -84,26 +105,24 @@ static int has_kernel_support(const char *fs_type, int flags)
>>>  		return 0;
>>>  	}
>>>  
>>> -	if (flags & TST_FS_SKIP_FUSE) {
>>> -		tst_res(TINFO, "Skipping FUSE as requested by the test");
>>> +	if (tst_fs_in_skiplist("fuse", skiplist))
>>>  		return 0;
>>> -	}
>>>  
>>>  	tst_res(TINFO, "FUSE does support %s", fs_type);
>>>  	return 1;
>>>  }
>>
>> I don't think that has_kernel_support() should look at the skiplist at
>> all. The entire skiplist logic should be handled in
>> tst_get_supported_fs_types(). But has_kernel_support() could return
>> different (non-zero) values for native support and for FUSE support.
> 
> I do not agree, that would add more complexity to an internal function
> that is not exported outside the library.

Your patchset adds complexity to tst_fs_is_supported() which is a public
wrapper of has_kernel_support(), even though it's only used indirectly
in shell tests. Some tests might use that function directly in the
future so let's make the interface cleaner, not hairier.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

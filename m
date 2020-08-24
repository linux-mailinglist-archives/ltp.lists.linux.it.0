Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82C2505EF
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 19:24:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8EB823C56C5
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 19:24:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0D7FA3C04C3
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 19:24:09 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 4FC82600834
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 19:24:09 +0200 (CEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2D58820B4908;
 Mon, 24 Aug 2020 10:24:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2D58820B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1598289847;
 bh=P+vH+9CgoxlkQcVVKVkVbeTTeVPmRvrMgEOQZfqs2Qw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=K5Pjs5SUP1ef+4WPSV7JOZBxbrNTXB3+yQ/+Fk2wtRuyZB04Pk4+M33NA9awaKWPQ
 dSbq5XK4lcuSe/9jKlvDtON3uSSoFARvVQqn86yG9O4eeUbJOQUOKxYJvGLxswA/de
 lJwNseAxO8usIcbmXmU+G8d28PJerE0RQSsLihbk=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-2-pvorel@suse.cz> <20200824171943.GA15693@dell5510>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <9bd0a70c-ba3f-3538-cf4f-fddcdb14c383@linux.microsoft.com>
Date: Mon, 24 Aug 2020 10:24:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824171943.GA15693@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-17.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [LTP v4 1/5] IMA/ima_keys.sh: Fix policy content check
 usage
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
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 8/24/20 10:19 AM, Petr Vorel wrote:

Hi Petr,

> 
>> require_ima_policy_content cannot be used in subshell $() evaluation,
>> because tst_brk does not quit the test. It calls cleanup for the
>> subshell process and main process then continue:
> ...
> 
> Merged this one to at least fix ima_keys.sh test.
> I'll wait little longer before merging the rest of v4 patchset
> https://patchwork.ozlabs.org/project/ltp/list/?series=196621
> 
Sorry for the late response.

I applied your v4 patches and ran keys tests. The issues reported 
earlier by Mimi are fixed.

thanks,
  -lakshmi




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

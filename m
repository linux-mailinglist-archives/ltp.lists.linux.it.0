Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E003612FBE3
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 18:59:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE9643C2453
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 18:59:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7D45F3C2445
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 18:59:22 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 82AF0600541
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 18:59:21 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 003HsKBL140532;
 Fri, 3 Jan 2020 17:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=/JwT8VnXv0DLdnc9vQddzFn7cLiMx0VDOrPpPrNsZMY=;
 b=cQ7ts0+p2nTTbBMhfwqWcA9+bOKgdOlH80uuGDZW4s1Go3Rha1lOSI+xRXsgZe5Lu25b
 AA3WkWHl+HkhgG1xxIWnHU2GFRKpxNfef1UXSPNIaVnMLkcF7FLsVVJ0RKEa/IeBR5q0
 kTnyB5qqhUimT4mhAKtBhntrrZ7bTmP9jCX0AfqCTtcOMw1TNBkz/gsiBzGj6Huu0uey
 JGxGHiT2OU5Y3eP0lwUw/IwgRm+T2WgfLLsILuKOluXFpq1+fLyUhtd11CbWhVk7LNp0
 9SPP78V1bLgtnmE61dnGgHPW3zZgx7KPvE11g3ifU5JkoE0oD0/IfP2G6VWjpG67hUDz Xw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2x5y0pwg0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Jan 2020 17:59:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 003HrQt0092250;
 Fri, 3 Jan 2020 17:57:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2x9jm7sdax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Jan 2020 17:57:01 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 003HuskY026134;
 Fri, 3 Jan 2020 17:56:55 GMT
Received: from [192.168.1.206] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 03 Jan 2020 09:56:54 -0800
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
 <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
 <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
 <20200103154518.GB1064304@kroah.com>
 <CAK8P3a00SpVfSE5oL8_F_8jHdg_8A5fyEKH_DWNyPToxack=zA@mail.gmail.com>
 <a2fc8b36-c512-b6dd-7349-dfb551e348b6@oracle.com>
Message-ID: <8283b231-f6e8-876f-7094-d3265096ab9a@oracle.com>
Date: Fri, 3 Jan 2020 09:56:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <a2fc8b36-c512-b6dd-7349-dfb551e348b6@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9489
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001030164
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9489
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001030164
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.4 000/191] 5.4.8-stable review
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
Cc: Sasha Levin <sashal@kernel.org>, David Howells <dhowells@redhat.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 1/3/20 9:33 AM, Mike Kravetz wrote:
> On 1/3/20 7:56 AM, Arnd Bergmann wrote:
>> On Fri, Jan 3, 2020 at 4:45 PM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>> On Fri, Jan 03, 2020 at 04:29:56PM +0100, Arnd Bergmann wrote:
>>>> On Fri, Jan 3, 2020 at 4:25 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>>>>
>>>>> On Fri, Jan 3, 2020 at 4:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>>>>>
>>>>>> On Fri, 3 Jan 2020 at 03:42, Greg Kroah-Hartman
>>>>>> <gregkh@linuxfoundation.org> wrote:
>>>>>
>>>>> -ENOENT is what you get when hugetlbfs is not mounted, so this hints to
>>>>>
>>>>> 8fc312b32b2  mm/hugetlbfs: fix error handling when setting up mounts
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?h=linux-5.4.y&id=3f549fb42a39bea3b29c0fc12afee53c4a01bec9
>>>>
>>>> I see that Mike Kravetz suggested not putting this patch into stable in
>>>>
>>>> https://lore.kernel.org/lkml/befca227-cb8a-8f47-617d-e3bf9972bfec@oracle.com/
>>>>
>>>> but it was picked through the autosel mechanism later.
>>>
>>> So does that mean that Linus's tree shows this LTP failure as well?
>>
>> Yes, according to
>> https://qa-reports.linaro.org/lkft/linux-mainline-oe/tests/ltp-syscalls-tests/memfd_create04
>> mainline has the same testcase failure, it started happening between
>> v5.4-10135-gc3bfc5dd73c6 and v5.4-10271-g596cf45cbf6e, when the patch
>> was originally merged into 5.5-rc1.
>>
>>> This does seem to fix a real issue, as shown by the LTP test noticing
>>> it, so should the error code value be fixed in Linus's tree?
>>
>> No idea what to conclude from the testcase failure, let's see if Mike has
>> any suggestions.
>>
> 
> Thanks for isolating to this patch!
> 
> There are dependencies between arch specific code and arch independent code
> during the setup of hugetlb sizes/mounts.  Let me take a closer look at the
> arm64 code and get access to a system for debug.

Before I started investigating, Jan Stancek found and fixed the issue.

http://lkml.kernel.org/r/a14b944b6e5e207d2f84f43227c98ed1f68290a2.1578072927.git.jstancek@redhat.com

-- 
Mike Kravetz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

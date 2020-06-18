Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBA01FF218
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 14:40:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 878493C2C8C
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 14:40:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4909B3C1C9A
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 14:40:45 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A5181600826
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 14:39:55 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05ICbV5S144725;
 Thu, 18 Jun 2020 12:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=YOUgEGmiVoECOPRuEBifjIlHRjn2KP8ChqSBuMvFU+M=;
 b=L4WL15jAa6NS8LVNt6SlhDoUuif6MhyAcTcDrclJdfi89VwQG/1Z+NHbZp+t+REmP10R
 wOAI9M5jCzzLb8nRb1/bcV8gYzAXhsvLkGHJnHkc6/mgfJ+Y9WpaZ623ePJBFnpM+tOg
 bBoCx1pppPkE1o/fhq6sGSGL0i25AWXbd4DoAYbmIiS4EOdHyqq8CoOnnsRqkyxjHGxk
 +5PK9PiuE5PiqUXD7bpgIbsLgogiZyNTGHwWmm+o2ogMVYu6kLAEXYFemHBvwgNTCd7I
 8Hi2ElSEoPHKvlRF1x0ooJV6Xreyc4XtW8yX97xQF+hFVYMc4spVlhaTPbVPAsQFtMBD Sg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 31qg356weq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 18 Jun 2020 12:40:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05ICJCSV101830;
 Thu, 18 Jun 2020 12:38:36 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 31q66ppvsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 12:38:36 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05ICcW6T003755;
 Thu, 18 Jun 2020 12:38:35 GMT
Received: from [192.168.1.39] (/91.247.148.3)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 18 Jun 2020 05:38:32 -0700
To: Petr Vorel <pvorel@suse.cz>
References: <20200608142744.274287-1-yangx.jy@cn.fujitsu.com>
 <20200608145831.GA2746544@x230>
 <423c55db-a393-d1d9-6de6-28f65f76557a@oracle.com>
 <20200617184356.GA7422@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <3e8b407b-fd12-c637-e199-3651fd280bbc@oracle.com>
Date: Thu, 18 Jun 2020 15:38:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617184356.GA7422@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9655
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006180095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9655
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 cotscore=-2147483648 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006180096
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/nfs_lib.sh: Use double quotes for grep
 pattern
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

On 17.06.2020 21:43, Petr Vorel wrote:
> Hi Alexey, Xiao,
> 
>> Perhaps this:
> 
>> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
>> index 59b373e..9c8f163 100644
>> --- a/testcases/lib/tst_net.sh
>> +++ b/testcases/lib/tst_net.sh
>> @@ -172,8 +172,7 @@ tst_rhost_run()
>>         local output=
>>         local ret=0
>>         if [ -n "${TST_USE_SSH:-}" ]; then
>> -               output=`ssh -n -q $user@$RHOST "sh -c \
>> -                       '$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
>> +               output=$(ssh -n -q $user@$RHOST "$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
>>         elif [ -n "$TST_USE_NETNS" ]; then
>>                 output=`$LTP_NETNS sh -c \
>>                         "$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`
> 
> Nice! Much simpler than what what I was just going to post (sed replacement).
> Would it work for rsh as well? i.e. can it work without sh -c?
> I have no working rsh setup.
> 
> And removing it from all 3 variants would be great (keeping them to be the same,
> also it might allow to also use shell functions, which doesn't work with sh -c
> "..."). Why was sh -c "..." used anyway?

Hi Petr,

Don't remember, so if all work without it I would remove it. For rsh,
I doubt that's is used now days, let's remove it too? The replacement (ssh)
in the tst_rhost_run() has been for a long time already.

> BTW I have more tst_net.sh, but I post them after we solve this one (as
> replacing quotes with sed, which is in my prepared patchset is ugly).
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

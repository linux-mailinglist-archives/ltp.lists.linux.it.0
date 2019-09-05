Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31025A9F23
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 12:02:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBA363C204E
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 12:02:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2AA9C3C13DE
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 12:02:01 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 61DB21A023B2
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 12:02:00 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x859xB76187169;
 Thu, 5 Sep 2019 10:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=WKqgSWYJsMQzKGT6TT4McR3PO8rp1iflTIfWcuw47kc=;
 b=igDdnHltNnFAz56NLjESCSPxH65/ZQw70vRq3soJ/mtBftCCYRQ8hHRb03lDlG7cACIn
 gZEj/kvuCMbK5gcY00GBe87ksNLRGiaDnwAWKjj8QbQSojkP0SHu1vbT+jW+jODK9RuU
 SfiLVgVgbSxbNU9iPq27VlQtwzHAilRqaGQCcsOkvjaTPF86bv0dsanvY9jjWof+mJi0
 zqE0ZjR2RBkJJS0GdpQmlw+e1Cc4EvzJWpCZD0V3cdTUwBH8vaGTN+GHu9kicKgobcu1
 vsW8uAoa5Cg23Vq3+t/Rz+kTJFUOjP6gqd2yoO6/tVj8vVXXBT3VBgBNKxVzj+kRVasR tQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2utyt8r4e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Sep 2019 10:01:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x859waKW048478;
 Thu, 5 Sep 2019 10:01:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2uthq1hf8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Sep 2019 10:01:56 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x85A1tiE011784;
 Thu, 5 Sep 2019 10:01:55 GMT
Received: from [10.191.11.186] (/10.191.11.186)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 05 Sep 2019 03:01:55 -0700
To: Li Wang <liwang@redhat.com>
References: <1567576823-10080-1-git-send-email-shuang.qiu@oracle.com>
 <CAEemH2fiJkau0A3yQH+nHVPXMwtTzyV3_weTQRniZFR+EJqN_g@mail.gmail.com>
From: Shuang Qiu <shuang.qiu@oracle.com>
Message-ID: <18fd25c6-857f-e049-8c8d-9640f4deba68@oracle.com>
Date: Thu, 5 Sep 2019 18:01:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2fiJkau0A3yQH+nHVPXMwtTzyV3_weTQRniZFR+EJqN_g@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909050101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909050101
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise09:Change PAGES size to the value more
 than 32
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 09/05/2019 04:29 PM, Li Wang wrote:
> On Wed, Sep 4, 2019 at 2:01 PM <shuang.qiu@oracle.com> wrote:
>> From: Shuang Qiu <shuang.qiu@oracle.com>
>>
>> In upstream patch 1a61ab (mm: memcontrol: replace zone summing with lruvec_page_state()),
>> it modify the lruvec state in batch,equal and less than 32 MADV_FREE pages will not trigger
>> the account of lruvec_stat,and will not be free in memory pressure either.
>> So the testcase may fail with:
>> ...
>> madvise09.c:219: INFO: Memory hungry child 6178 started, try 10
>> madvise09.c:254: INFO: Memory map: pppppppppppppppppppppppppppppppp
>> madvise09.c:259: FAIL: No MADV_FREE page was freed on low memory
>> ...
>> Change the PAGES to the value more than 32 can fix such issue.
>>
>> Signed-off-by: Shuang Qiu <shuang.qiu@oracle.com>
>> ---
>>   testcases/kernel/syscalls/madvise/madvise09.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/testcases/kernel/syscalls/madvise/madvise09.c b/testcases/kernel/syscalls/madvise/madvise09.c
>> index 01075f6..3759053 100644
>> --- a/testcases/kernel/syscalls/madvise/madvise09.c
>> +++ b/testcases/kernel/syscalls/madvise/madvise09.c
>> @@ -57,7 +57,7 @@ static int sleep_between_faults;
>>
>>   static int swap_accounting_enabled;
>>
>> -#define PAGES 32
>> +#define PAGES 64
> I'm not sure why 64 pages is a proper value? Can you explain more?
I think any value which larger than 32 is ok.
So I tested 64 and works fine.

Thanks
Shuang
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
